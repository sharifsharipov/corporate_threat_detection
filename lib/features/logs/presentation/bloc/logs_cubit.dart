import 'dart:async';
import 'dart:developer';

import 'package:corporate_threat_detection/features/logs/data/models/system_log_model/system_log_model.dart';
import 'package:corporate_threat_detection/features/logs/domain/use_cases/get_system_logs_use_case.dart';
import 'package:corporate_threat_detection/features/logs/domain/use_cases/stream_system_logs_by_level_use_case.dart';
import 'package:corporate_threat_detection/features/logs/domain/use_cases/stream_system_logs_use_case.dart';
import 'package:corporate_threat_detection/features/logs/presentation/bloc/logs_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogsCubit extends Cubit<LogsState> {
  final GetSystemLogsUseCase getSystemLogsUseCase;
  final StreamSystemLogsUseCase streamSystemLogsUseCase;
  final StreamSystemLogsByLevelUseCase streamSystemLogsByLevelUseCase;
  StreamSubscription? _logsSubscription;

  LogsCubit({
    required this.getSystemLogsUseCase,
    required this.streamSystemLogsUseCase,
    required this.streamSystemLogsByLevelUseCase,
  }) : super(LogsState.initial());

  Future<void> fetchInitial({int limit = 200}) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final result = await getSystemLogsUseCase(
      GetSystemLogsParams(limit: limit),
    );
    result.either(
      (failure) =>
          emit(state.copyWith(isLoading: false, errorMessage: failure.message)),
      (logs) => emit(
        state.copyWith(
          isLoading: false,
          logs: logs.isNotEmpty ? logs : _mockLogs,
          errorMessage: null,
        ),
      ),
    );
  }

  void startRealtime({int limit = 200}) {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    _logsSubscription?.cancel();
    _logsSubscription =
        streamSystemLogsUseCase(StreamSystemLogsParams(limit: limit)).listen(
          (result) {
            result.either(
              (failure) => emit(
                state.copyWith(isLoading: false, errorMessage: failure.message),
              ),
              (logs) => emit(
                state.copyWith(
                  isLoading: false,
                  logs: logs.isNotEmpty ? logs : _mockLogs,
                  errorMessage: null,
                ),
              ),
            );
          },
          onError: (Object error) {
            emit(
              state.copyWith(isLoading: false, errorMessage: error.toString()),
            );
          },
        );
  }

  static final List<SystemLogModel> _mockLogs = [
    SystemLogModel(
      timestamp: DateTime.now().subtract(const Duration(seconds: 10)),
      level: LogLevel.info,
      source: 'AUTH-MODULE',
      message: 'User admin logged in from 10.0.0.5',
    ),
    SystemLogModel(
      timestamp: DateTime.now().subtract(const Duration(seconds: 45)),
      level: LogLevel.warning,
      source: 'FIREWALL',
      message: 'Blocked connection attempt from 185.12.33.4:443',
    ),
    SystemLogModel(
      timestamp: DateTime.now().subtract(const Duration(minutes: 2)),
      level: LogLevel.error,
      source: 'DATABASE',
      message: 'Connection timeout on DB-CLUSTER-POOL-1',
    ),
    SystemLogModel(
      timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
      level: LogLevel.error,
      source: 'IDS',
      message: 'Potential remote code execution attempt detected!',
    ),
    SystemLogModel(
      timestamp: DateTime.now().subtract(const Duration(minutes: 12)),
      level: LogLevel.info,
      source: 'SYSTEM',
      message: 'Automatic security patch deployed successfully',
    ),
  ];

  void startRealtimeByLevel(LogLevel? level, {int limit = 200}) {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    _logsSubscription?.cancel();
    if (level == null) {
      startRealtime(limit: limit);
      return;
    }
    _logsSubscription =
        streamSystemLogsByLevelUseCase(
          StreamSystemLogsByLevelParams(level: level, limit: limit),
        ).listen(
          (result) {
            result.either(
              (failure) => emit(
                state.copyWith(isLoading: false, errorMessage: failure.message),
              ),
              (logs) => emit(
                state.copyWith(
                  isLoading: false,
                  logs: logs,
                  errorMessage: null,
                ),
              ),
            );
          },
          onError: (Object error) {
            emit(
              state.copyWith(isLoading: false, errorMessage: error.toString()),
            );
          },
        );
  }

  void setLevel(LogLevel? level) {
    emit(state.copyWith(selectedLevel: level));
    startRealtimeByLevel(level);
  }

  void setSearchQuery(String query) {
    emit(state.copyWith(searchQuery: query));
  }

  void toggleAutoScroll() {
    emit(state.copyWith(autoScroll: !state.autoScroll));
  }

  void exportLogs(List<SystemLogModel> logs) {
    log('Exporting ${logs.length} logs...');
  }

  void clearFilters() {
    emit(state.copyWith(selectedLevel: null, searchQuery: ''));
    startRealtimeByLevel(null);
  }

  @override
  Future<void> close() {
    _logsSubscription?.cancel();
    return super.close();
  }
}
