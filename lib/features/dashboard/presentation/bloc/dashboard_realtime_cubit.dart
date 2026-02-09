import 'dart:async';

import 'package:corporate_threat_detection/features/dashboard/domain/usecases/stream_realtime_activity_use_case.dart';
import 'package:corporate_threat_detection/features/dashboard/domain/usecases/stream_realtime_metrics_use_case.dart';
import 'package:corporate_threat_detection/features/dashboard/domain/usecases/stream_threat_feed_use_case.dart';
import 'package:corporate_threat_detection/features/dashboard/domain/usecases/stream_threat_map_locations_use_case.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/bloc/dashboard_realtime_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardRealtimeCubit extends Cubit<DashboardRealtimeState> {
  final StreamRealtimeMetricsUseCase streamRealtimeMetricsUseCase;
  final StreamRealtimeActivityUseCase streamRealtimeActivityUseCase;
  final StreamThreatFeedUseCase streamThreatFeedUseCase;
  final StreamThreatMapLocationsUseCase streamThreatMapLocationsUseCase;

  StreamSubscription? _metricsSubscription;
  StreamSubscription? _activitySubscription;
  StreamSubscription? _feedSubscription;
  StreamSubscription? _mapSubscription;

  DashboardRealtimeCubit({
    required this.streamRealtimeMetricsUseCase,
    required this.streamRealtimeActivityUseCase,
    required this.streamThreatFeedUseCase,
    required this.streamThreatMapLocationsUseCase,
  }) : super(DashboardRealtimeState.initial());

  void startRealtime() {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    _metricsSubscription?.cancel();
    _activitySubscription?.cancel();
    _feedSubscription?.cancel();
    _mapSubscription?.cancel();

    _metricsSubscription = streamRealtimeMetricsUseCase().listen((result) {
      result.either(
        (failure) =>
            emit(state.copyWith(isLoading: false, errorMessage: failure.message)),
        (metrics) => emit(
          state.copyWith(isLoading: false, metrics: metrics, errorMessage: null),
        ),
      );
    }, onError: (Object error) {
      emit(state.copyWith(isLoading: false, errorMessage: error.toString()));
    });

    _activitySubscription = streamRealtimeActivityUseCase().listen((result) {
      result.either(
        (failure) => emit(state.copyWith(errorMessage: failure.message)),
        (points) =>
            emit(state.copyWith(activityPoints: points, errorMessage: null)),
      );
    }, onError: (Object error) {
      emit(state.copyWith(errorMessage: error.toString()));
    });

    _feedSubscription = streamThreatFeedUseCase().listen((result) {
      result.either(
        (failure) => emit(state.copyWith(errorMessage: failure.message)),
        (feed) => emit(state.copyWith(threatFeed: feed, errorMessage: null)),
      );
    }, onError: (Object error) {
      emit(state.copyWith(errorMessage: error.toString()));
    });

    _mapSubscription = streamThreatMapLocationsUseCase().listen((result) {
      result.either(
        (failure) => emit(state.copyWith(errorMessage: failure.message)),
        (locations) =>
            emit(state.copyWith(mapLocations: locations, errorMessage: null)),
      );
    }, onError: (Object error) {
      emit(state.copyWith(errorMessage: error.toString()));
    });
  }

  @override
  Future<void> close() {
    _metricsSubscription?.cancel();
    _activitySubscription?.cancel();
    _feedSubscription?.cancel();
    _mapSubscription?.cancel();
    return super.close();
  }
}
