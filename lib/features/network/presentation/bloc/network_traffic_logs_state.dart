import 'package:corporate_threat_detection/features/logs/data/models/traffic_log/traffic_log.dart';
import 'package:equatable/equatable.dart';

class NetworkTrafficLogsState extends Equatable {
  final bool isLoading;
  final List<TrafficLog> logs;
  final String? errorMessage;

  const NetworkTrafficLogsState({
    required this.isLoading,
    required this.logs,
    required this.errorMessage,
  });

  factory NetworkTrafficLogsState.initial() => const NetworkTrafficLogsState(
    isLoading: false,
    logs: [],
    errorMessage: null,
  );

  NetworkTrafficLogsState copyWith({
    bool? isLoading,
    List<TrafficLog>? logs,
    String? errorMessage,
  }) {
    return NetworkTrafficLogsState(
      isLoading: isLoading ?? this.isLoading,
      logs: logs ?? this.logs,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => <Object?>[isLoading, logs, errorMessage];
}
