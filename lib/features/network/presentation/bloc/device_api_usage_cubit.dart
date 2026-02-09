import 'dart:async';

import 'package:corporate_threat_detection/features/network/domain/use_cases/stream_device_api_usage_use_case.dart';
import 'package:corporate_threat_detection/features/network/presentation/bloc/device_api_usage_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeviceApiUsageCubit extends Cubit<DeviceApiUsageState> {
  final StreamDeviceApiUsageUseCase streamDeviceApiUsageUseCase;
  StreamSubscription? _subscription;

  DeviceApiUsageCubit({required this.streamDeviceApiUsageUseCase})
      : super(DeviceApiUsageState.initial());

  void startRealtime({String? deviceId, int limit = 200}) {
    emit(
      state.copyWith(
        isLoading: true,
        errorMessage: null,
        deviceId: deviceId,
      ),
    );
    _subscription?.cancel();
    _subscription =
        streamDeviceApiUsageUseCase(deviceId: deviceId, limit: limit).listen(
      (result) {
        result.either(
          (failure) => emit(
            state.copyWith(isLoading: false, errorMessage: failure.message),
          ),
          (usage) => emit(
            state.copyWith(
              isLoading: false,
              usage: usage,
              errorMessage: null,
              deviceId: deviceId,
            ),
          ),
        );
      },
      onError: (Object error) {
        emit(state.copyWith(isLoading: false, errorMessage: error.toString()));
      },
    );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
