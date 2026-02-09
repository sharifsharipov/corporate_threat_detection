import 'dart:async';

import 'package:corporate_threat_detection/features/network/domain/use_cases/stream_traffic_logs_use_case.dart';
import 'package:corporate_threat_detection/features/network/presentation/bloc/network_traffic_logs_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NetworkTrafficLogsCubit extends Cubit<NetworkTrafficLogsState> {
  final StreamTrafficLogsUseCase streamTrafficLogsUseCase;
  StreamSubscription? _subscription;

  NetworkTrafficLogsCubit({required this.streamTrafficLogsUseCase})
    : super(NetworkTrafficLogsState.initial());

  void startRealtime({int limit = 200}) {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    _subscription?.cancel();
    _subscription = streamTrafficLogsUseCase(limit: limit).listen((result) {
      result.either(
        (failure) => emit(
          state.copyWith(isLoading: false, errorMessage: failure.message),
        ),
        (logs) => emit(
          state.copyWith(isLoading: false, logs: logs, errorMessage: null),
        ),
      );
    }, onError: (Object error) {
      emit(state.copyWith(isLoading: false, errorMessage: error.toString()));
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
