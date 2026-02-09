import 'package:corporate_threat_detection/features/dashboard/data/models/alert_model/alert_model.dart';
import 'package:corporate_threat_detection/features/dashboard/data/models/stat_model/stat_model.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/pages/dashboard_overview_page/widgets/threat_level_indicator.dart';
import 'package:equatable/equatable.dart';

class DashboardOverviewState extends Equatable {
  final bool isLoading;
  final List<StatModel> stats;
  final List<AlertModel> alerts;
  final String? errorMessage;
  final ThreatLevel threatLevel;
  final int threatPercentage;

  const DashboardOverviewState({
    required this.isLoading,
    required this.stats,
    required this.alerts,
    required this.errorMessage,
    required this.threatLevel,
    required this.threatPercentage,
  });

  factory DashboardOverviewState.initial() => const DashboardOverviewState(
        isLoading: false,
        stats: [],
        alerts: [],
        errorMessage: null,
        threatLevel: ThreatLevel.low,
        threatPercentage: 0,
      );

  DashboardOverviewState copyWith({
    bool? isLoading,
    List<StatModel>? stats,
    List<AlertModel>? alerts,
    String? errorMessage,
    ThreatLevel? threatLevel,
    int? threatPercentage,
  }) {
    return DashboardOverviewState(
      isLoading: isLoading ?? this.isLoading,
      stats: stats ?? this.stats,
      alerts: alerts ?? this.alerts,
      errorMessage: errorMessage,
      threatLevel: threatLevel ?? this.threatLevel,
      threatPercentage: threatPercentage ?? this.threatPercentage,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        isLoading,
        stats,
        alerts,
        errorMessage,
        threatLevel,
        threatPercentage,
      ];
}
