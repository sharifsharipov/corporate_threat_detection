import 'dart:async';

import 'package:corporate_threat_detection/features/methods/domain/usecases/stream_detection_methods_use_case.dart';
import 'package:corporate_threat_detection/features/methods/presentation/bloc/methods_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MethodsCubit extends Cubit<MethodsState> {
  final StreamDetectionMethodsUseCase streamDetectionMethodsUseCase;
  StreamSubscription? _subscription;

  MethodsCubit({required this.streamDetectionMethodsUseCase})
      : super(MethodsState.initial());

  void startRealtime({String? type, int limit = 200}) {
    emit(state.copyWith(isLoading: true, errorMessage: null, activeType: type));
    _subscription?.cancel();
    _subscription =
        streamDetectionMethodsUseCase(type: type, limit: limit).listen(
      (result) {
        result.either(
          (failure) => emit(
            state.copyWith(isLoading: false, errorMessage: failure.message),
          ),
          (methods) => emit(
            state.copyWith(
              isLoading: false,
              methods: methods,
              errorMessage: null,
              activeType: type,
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
