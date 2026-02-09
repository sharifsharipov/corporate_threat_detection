import 'dart:async';

import 'package:corporate_threat_detection/features/network/domain/use_cases/stream_network_protocols_use_case.dart';
import 'package:corporate_threat_detection/features/network/presentation/bloc/network_protocols_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NetworkProtocolsCubit extends Cubit<NetworkProtocolsState> {
  final StreamNetworkProtocolsUseCase streamNetworkProtocolsUseCase;
  StreamSubscription? _subscription;

  NetworkProtocolsCubit({required this.streamNetworkProtocolsUseCase})
      : super(NetworkProtocolsState.initial());

  void startRealtime({int limit = 200}) {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    _subscription?.cancel();
    _subscription = streamNetworkProtocolsUseCase(limit: limit).listen(
      (result) {
        result.either(
          (failure) => emit(
            state.copyWith(isLoading: false, errorMessage: failure.message),
          ),
          (protocols) => emit(
            state.copyWith(
              isLoading: false,
              protocols: protocols,
              errorMessage: null,
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
