import 'dart:async';

import 'package:corporate_threat_detection/features/logs/data/models/history_event_model/history_event_model.dart';
import 'package:corporate_threat_detection/features/logs/domain/use_cases/stream_history_events_by_severity_use_case.dart';
import 'package:corporate_threat_detection/features/logs/domain/use_cases/stream_history_events_use_case.dart';
import 'package:corporate_threat_detection/features/logs/presentation/bloc/history_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryCubit extends Cubit<HistoryState> {
  final StreamHistoryEventsUseCase streamHistoryEventsUseCase;
  final StreamHistoryEventsBySeverityUseCase streamHistoryEventsBySeverityUseCase;
  StreamSubscription? _subscription;

  HistoryCubit({
    required this.streamHistoryEventsUseCase,
    required this.streamHistoryEventsBySeverityUseCase,
  }) : super(HistoryState.initial());

  void startRealtime({int limit = 200}) {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    _subscription?.cancel();
    _subscription = streamHistoryEventsUseCase(limit: limit).listen((result) {
      result.either(
        (failure) => emit(
          state.copyWith(isLoading: false, errorMessage: failure.message),
        ),
        (events) => emit(
          state.copyWith(isLoading: false, events: events, errorMessage: null),
        ),
      );
    }, onError: (Object error) {
      emit(state.copyWith(isLoading: false, errorMessage: error.toString()));
    });
  }

  void startRealtimeBySeverity(EventSeverity? severity, {int limit = 200}) {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    _subscription?.cancel();
    if (severity == null) {
      startRealtime(limit: limit);
      return;
    }
    _subscription = streamHistoryEventsBySeverityUseCase(
      severity,
      limit: limit,
    ).listen((result) {
      result.either(
        (failure) => emit(
          state.copyWith(isLoading: false, errorMessage: failure.message),
        ),
        (events) => emit(
          state.copyWith(isLoading: false, events: events, errorMessage: null),
        ),
      );
    }, onError: (Object error) {
      emit(state.copyWith(isLoading: false, errorMessage: error.toString()));
    });
  }

  void setSeverity(EventSeverity? severity) {
    emit(state.copyWith(selectedSeverity: severity));
    startRealtimeBySeverity(severity);
  }

  void setSearchQuery(String query) {
    emit(state.copyWith(searchQuery: query));
  }

  void clearFilters() {
    emit(state.copyWith(selectedSeverity: null, searchQuery: ''));
    startRealtimeBySeverity(null);
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
