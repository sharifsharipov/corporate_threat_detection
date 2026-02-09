import 'dart:async';

import 'package:corporate_threat_detection/features/network/domain/use_cases/stream_network_device_use_case.dart';
import 'package:corporate_threat_detection/features/network/domain/use_cases/stream_traffic_logs_by_device_use_case.dart';
import 'package:corporate_threat_detection/features/network/presentation/bloc/device_detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeviceDetailCubit extends Cubit<DeviceDetailState> {
  final StreamNetworkDeviceUseCase streamNetworkDeviceUseCase;
  final StreamTrafficLogsByDeviceUseCase streamTrafficLogsByDeviceUseCase;

  StreamSubscription? _deviceSubscription;
  StreamSubscription? _logsSubscription;

  DeviceDetailCubit({
    required this.streamNetworkDeviceUseCase,
    required this.streamTrafficLogsByDeviceUseCase,
  }) : super(DeviceDetailState.initial());

  void startRealtime({required String deviceId, int logsLimit = 50}) {
    emit(
      state.copyWith(
        isLoading: true,
        errorMessage: null,
        deviceId: deviceId,
      ),
    );
    _deviceSubscription?.cancel();
    _logsSubscription?.cancel();

    _deviceSubscription =
        streamNetworkDeviceUseCase(deviceId: deviceId).listen((result) {
      result.either(
        (failure) => emit(
          state.copyWith(isLoading: false, errorMessage: failure.message),
        ),
        (device) => emit(
          state.copyWith(
            isLoading: false,
            device: device,
            errorMessage: null,
          ),
        ),
      );
    }, onError: (Object error) {
      emit(state.copyWith(isLoading: false, errorMessage: error.toString()));
    });

    _logsSubscription =
        streamTrafficLogsByDeviceUseCase(deviceId: deviceId, limit: logsLimit)
            .listen((result) {
      result.either(
        (failure) => emit(
          state.copyWith(errorMessage: failure.message),
        ),
        (logs) => emit(state.copyWith(logs: logs, errorMessage: null)),
      );
    }, onError: (Object error) {
      emit(state.copyWith(errorMessage: error.toString()));
    });
  }

  @override
  Future<void> close() {
    _deviceSubscription?.cancel();
    _logsSubscription?.cancel();
    return super.close();
  }
}
