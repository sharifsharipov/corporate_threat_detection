import 'dart:async';

import 'package:corporate_threat_detection/features/settings/data/models/alert_item_model/alert_item_model.dart';
import 'package:corporate_threat_detection/features/settings/domain/use_cases/stream_alerts_by_severity_use_case.dart';
import 'package:corporate_threat_detection/features/settings/domain/use_cases/stream_alerts_use_case.dart';
import 'package:corporate_threat_detection/features/settings/domain/use_cases/update_alert_status_use_case.dart';
import 'package:corporate_threat_detection/features/settings/presentation/bloc/alerts_state.dart';
import 'package:corporate_threat_detection/features/settings/presentation/pages/alerts_page/widgets/alert_filter_tabs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlertsCubit extends Cubit<AlertsState> {
  final StreamAlertsUseCase streamAlertsUseCase;
  final StreamAlertsBySeverityUseCase streamAlertsBySeverityUseCase;
  final UpdateAlertStatusUseCase updateAlertStatusUseCase;
  StreamSubscription? _subscription;

  AlertsCubit({
    required this.streamAlertsUseCase,
    required this.streamAlertsBySeverityUseCase,
    required this.updateAlertStatusUseCase,
  }) : super(AlertsState.initial());

  void startRealtime({int limit = 200}) {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    _subscription?.cancel();
    _subscription = streamAlertsUseCase(limit: limit).listen(
      (result) {
        result.either(
          (failure) => emit(
            state.copyWith(isLoading: false, errorMessage: failure.message),
          ),
          (alerts) => emit(
            state.copyWith(
              isLoading: false,
              alerts: alerts.isNotEmpty ? alerts : _mockAlerts,
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

  void startRealtimeByFilter(AlertFilter filter, {int limit = 200}) {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    _subscription?.cancel();
    if (filter == AlertFilter.all) {
      startRealtime(limit: limit);
      return;
    }
    final severity = _mapFilterToSeverity(filter);
    _subscription = streamAlertsBySeverityUseCase(severity, limit: limit)
        .listen(
          (result) {
            result.either(
              (failure) => emit(
                state.copyWith(isLoading: false, errorMessage: failure.message),
              ),
              (alerts) => emit(
                state.copyWith(
                  isLoading: false,
                  alerts: alerts.isNotEmpty
                      ? alerts
                      : _mockAlerts
                            .where((a) => a.severity == severity)
                            .toList(),
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

  void setFilter(AlertFilter filter) {
    emit(state.copyWith(selectedFilter: filter));
    startRealtimeByFilter(filter);
  }

  Future<void> acknowledge(String id) async {
    // Optimistic update
    final updated = state.alerts.map((a) {
      if (a.id == id) {
        return AlertItemModel(
          id: a.id,
          title: a.title,
          description: a.description,
          severity: a.severity,
          status: AlertStatus.acknowledged,
          timestamp: a.timestamp,
        );
      }
      return a;
    }).toList();
    emit(state.copyWith(alerts: updated));

    final result = await updateAlertStatusUseCase(id, AlertStatus.acknowledged);
    result.either(
      (failure) => emit(state.copyWith(errorMessage: failure.message)),
      (_) => null,
    );
  }

  Future<void> resolve(String id) async {
    // Optimistic update
    final updated = state.alerts.map((a) {
      if (a.id == id) {
        return AlertItemModel(
          id: a.id,
          title: a.title,
          description: a.description,
          severity: a.severity,
          status: AlertStatus.resolved,
          timestamp: a.timestamp,
        );
      }
      return a;
    }).toList();
    emit(state.copyWith(alerts: updated));

    final result = await updateAlertStatusUseCase(id, AlertStatus.resolved);
    result.either(
      (failure) => emit(state.copyWith(errorMessage: failure.message)),
      (_) => null,
    );
  }

  static final List<AlertItemModel> _mockAlerts = [
    AlertItemModel(
      id: 'A-1',
      title: 'Failed login attempts',
      description: 'Persistent failed login attempts detected on WS-ADMIN-01',
      severity: AlertSeverity.high,
      status: AlertStatus.active,
      timestamp: DateTime.now().subtract(const Duration(minutes: 10)),
    ),
    AlertItemModel(
      id: 'A-2',
      title: 'Inbound traffic spike',
      description: 'Unusually high traffic detected from external IP 185.x.x.x',
      severity: AlertSeverity.critical,
      status: AlertStatus.acknowledged,
      timestamp: DateTime.now().subtract(const Duration(hours: 1)),
    ),
    AlertItemModel(
      id: 'A-3',
      title: 'System Patch Pending',
      description: 'Critical security patch pending for SRV-DATA-02',
      severity: AlertSeverity.medium,
      status: AlertStatus.active,
      timestamp: DateTime.now().subtract(const Duration(days: 1)),
    ),
  ];

  AlertSeverity _mapFilterToSeverity(AlertFilter filter) {
    switch (filter) {
      case AlertFilter.critical:
        return AlertSeverity.critical;
      case AlertFilter.high:
        return AlertSeverity.high;
      case AlertFilter.medium:
        return AlertSeverity.medium;
      case AlertFilter.low:
        return AlertSeverity.low;
      case AlertFilter.all:
        return AlertSeverity.low;
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
