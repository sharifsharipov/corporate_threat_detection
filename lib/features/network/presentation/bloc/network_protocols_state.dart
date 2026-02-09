import 'package:corporate_threat_detection/features/network/data/models/network_protocol_model/network_protocol_model.dart';
import 'package:equatable/equatable.dart';

class NetworkProtocolsState extends Equatable {
  final bool isLoading;
  final List<NetworkProtocolModel> protocols;
  final String? errorMessage;

  const NetworkProtocolsState({
    required this.isLoading,
    required this.protocols,
    required this.errorMessage,
  });

  factory NetworkProtocolsState.initial() => const NetworkProtocolsState(
        isLoading: false,
        protocols: [],
        errorMessage: null,
      );

  NetworkProtocolsState copyWith({
    bool? isLoading,
    List<NetworkProtocolModel>? protocols,
    String? errorMessage,
  }) {
    return NetworkProtocolsState(
      isLoading: isLoading ?? this.isLoading,
      protocols: protocols ?? this.protocols,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => <Object?>[isLoading, protocols, errorMessage];
}
