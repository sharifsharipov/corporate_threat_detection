import 'package:corporate_threat_detection/features/logs/data/models/system_log_model/system_log_model.dart';
import 'package:equatable/equatable.dart';

class LogsState extends Equatable {
  final bool isLoading;
  final List<SystemLogModel> logs;
  final String? errorMessage;
  final LogLevel? selectedLevel;
  final String searchQuery;
  final bool autoScroll;

  const LogsState({
    required this.isLoading,
    required this.logs,
    required this.errorMessage,
    required this.selectedLevel,
    required this.searchQuery,
    required this.autoScroll,
  });

  factory LogsState.initial() => const LogsState(
    isLoading: false,
    logs: [],
    errorMessage: null,
    selectedLevel: null,
    searchQuery: '',
    autoScroll: false,
  );

  LogsState copyWith({
    bool? isLoading,
    List<SystemLogModel>? logs,
    String? errorMessage,
    Object? selectedLevel = _unset,
    String? searchQuery,
    bool? autoScroll,
  }) {
    return LogsState(
      isLoading: isLoading ?? this.isLoading,
      logs: logs ?? this.logs,
      errorMessage: errorMessage,
      selectedLevel: selectedLevel == _unset
          ? this.selectedLevel
          : selectedLevel as LogLevel?,
      searchQuery: searchQuery ?? this.searchQuery,
      autoScroll: autoScroll ?? this.autoScroll,
    );
  }

  @override
  List<Object?> get props => <Object?>[
    isLoading,
    logs,
    errorMessage,
    selectedLevel,
    searchQuery,
    autoScroll,
  ];
}

const Object _unset = Object();
