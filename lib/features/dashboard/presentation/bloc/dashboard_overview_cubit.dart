import 'dart:async';

import 'package:corporate_threat_detection/features/dashboard/data/models/alert_model/alert_model.dart';
import 'package:corporate_threat_detection/features/dashboard/data/models/stat_model/stat_model.dart';
import 'package:corporate_threat_detection/features/dashboard/domain/usecases/stream_dashboard_stats_use_case.dart';
import 'package:corporate_threat_detection/features/dashboard/domain/usecases/stream_recent_alerts_use_case.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/bloc/dashboard_overview_state.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/pages/dashboard_overview_page/widgets/threat_level_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardOverviewCubit extends Cubit<DashboardOverviewState> {
  final StreamDashboardStatsUseCase streamDashboardStatsUseCase;
  final StreamRecentAlertsUseCase streamRecentAlertsUseCase;

  StreamSubscription? _statsSubscription;
  StreamSubscription? _alertsSubscription;

  DashboardOverviewCubit({
    required this.streamDashboardStatsUseCase,
    required this.streamRecentAlertsUseCase,
  }) : super(DashboardOverviewState.initial());

  void startRealtime() {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    _statsSubscription?.cancel();
    _alertsSubscription?.cancel();

    _statsSubscription = streamDashboardStatsUseCase().listen(
      (result) {
        result.either(
          (failure) => emit(
            state.copyWith(isLoading: false, errorMessage: failure.message),
          ),
          (stats) => emit(
            state.copyWith(
              isLoading: false,
              stats: stats.isNotEmpty ? stats : _mockStats,
              errorMessage: null,
            ),
          ),
        );
      },
      onError: (Object error) {
        emit(state.copyWith(isLoading: false, errorMessage: error.toString()));
      },
    );

    _alertsSubscription = streamRecentAlertsUseCase().listen(
      (result) {
        result.either(
          (failure) => emit(
            state.copyWith(isLoading: false, errorMessage: failure.message),
          ),
          (alerts) {
            final effectiveAlerts = alerts.isNotEmpty ? alerts : _mockAlerts;
            final level = _deriveThreatLevel(effectiveAlerts);
            final percentage = _deriveThreatPercentage(effectiveAlerts);
            emit(
              state.copyWith(
                isLoading: false,
                alerts: effectiveAlerts,
                threatLevel: level,
                threatPercentage: percentage,
                errorMessage: null,
              ),
            );
          },
        );
      },
      onError: (Object error) {
        emit(state.copyWith(isLoading: false, errorMessage: error.toString()));
      },
    );
  }

  static final List<StatModel> _mockStats = [
    StatModel(
      label: 'Total Threats',
      value: '1,284',
      iconCodePoint: 0xe5d3, // shield_rounded
      colorValue: 0xFFF71E52,
      backgroundColorValue: 0xFFFFFFFF,
    ),
    StatModel(
      label: 'Active Alerts',
      value: '42',
      iconCodePoint: 0xe44f, // notifications_active_rounded
      colorValue: 0xFFF7931E,
      backgroundColorValue: 0xFFFFFFFF,
    ),
    StatModel(
      label: 'Resolved',
      value: '98%',
      iconCodePoint: 0xe156, // check_circle_rounded
      colorValue: 0xFF03A64B,
      backgroundColorValue: 0xFFFFFFFF,
    ),
    StatModel(
      label: 'System Status',
      value: 'Secure',
      iconCodePoint: 0xe897, // monitor_heart_rounded
      colorValue: 0xFF144DDE,
      backgroundColorValue: 0xFFFFFFFF,
    ),
  ];

  static final List<AlertModel> _mockAlerts = [
    AlertModel(
      title: 'Suspicious login attempt from unknown IP',
      severity: AlertSeverity.high,
      timestamp: DateTime.now().subtract(const Duration(minutes: 12)),
      isRead: false,
    ),
    AlertModel(
      title: 'Massive data transfer detected from Server-A',
      severity: AlertSeverity.critical,
      timestamp: DateTime.now().subtract(const Duration(minutes: 45)),
      isRead: false,
    ),
    AlertModel(
      title: 'New device connected to Corporate-WiFi',
      severity: AlertSeverity.low,
      timestamp: DateTime.now().subtract(const Duration(hours: 2)),
      isRead: true,
    ),
    AlertModel(
      title: 'Potential SQL injection attempt on Web-UI',
      severity: AlertSeverity.medium,
      timestamp: DateTime.now().subtract(const Duration(hours: 5)),
      isRead: true,
    ),
  ];

  ThreatLevel _deriveThreatLevel(List<AlertModel> alerts) {
    if (alerts.any((alert) => alert.severity == AlertSeverity.critical)) {
      return ThreatLevel.critical;
    }
    if (alerts.any((alert) => alert.severity == AlertSeverity.high)) {
      return ThreatLevel.high;
    }
    if (alerts.any((alert) => alert.severity == AlertSeverity.medium)) {
      return ThreatLevel.medium;
    }
    return ThreatLevel.low;
  }

  int _deriveThreatPercentage(List<AlertModel> alerts) {
    if (alerts.isEmpty) {
      return 0;
    }
    int score = 0;
    for (final alert in alerts) {
      switch (alert.severity) {
        case AlertSeverity.critical:
          score += 4;
        case AlertSeverity.high:
          score += 3;
        case AlertSeverity.medium:
          score += 2;
        case AlertSeverity.low:
          score += 1;
      }
    }
    final maxScore = alerts.length * 4;
    return ((score / maxScore) * 100).round().clamp(0, 100);
  }

  @override
  Future<void> close() {
    _statsSubscription?.cancel();
    _alertsSubscription?.cancel();
    return super.close();
  }
}
