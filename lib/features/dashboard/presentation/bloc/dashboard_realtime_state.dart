import 'package:corporate_threat_detection/features/dashboard/data/models/realtime_metric_model/realtime_metric_model.dart';
import 'package:corporate_threat_detection/features/dashboard/data/models/threat_feed_model/threat_feed_model.dart';
import 'package:corporate_threat_detection/features/dashboard/data/models/threat_map_location_model/threat_map_location_model.dart';
import 'package:equatable/equatable.dart';

class DashboardRealtimeState extends Equatable {
  final bool isLoading;
  final List<RealtimeMetricModel> metrics;
  final List<int> activityPoints;
  final List<ThreatFeedModel> threatFeed;
  final List<ThreatMapLocationModel> mapLocations;
  final String? errorMessage;

  const DashboardRealtimeState({
    required this.isLoading,
    required this.metrics,
    required this.activityPoints,
    required this.threatFeed,
    required this.mapLocations,
    required this.errorMessage,
  });

  factory DashboardRealtimeState.initial() => const DashboardRealtimeState(
        isLoading: false,
        metrics: [],
        activityPoints: [],
        threatFeed: [],
        mapLocations: [],
        errorMessage: null,
      );

  DashboardRealtimeState copyWith({
    bool? isLoading,
    List<RealtimeMetricModel>? metrics,
    List<int>? activityPoints,
    List<ThreatFeedModel>? threatFeed,
    List<ThreatMapLocationModel>? mapLocations,
    String? errorMessage,
  }) {
    return DashboardRealtimeState(
      isLoading: isLoading ?? this.isLoading,
      metrics: metrics ?? this.metrics,
      activityPoints: activityPoints ?? this.activityPoints,
      threatFeed: threatFeed ?? this.threatFeed,
      mapLocations: mapLocations ?? this.mapLocations,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        isLoading,
        metrics,
        activityPoints,
        threatFeed,
        mapLocations,
        errorMessage,
      ];
}
