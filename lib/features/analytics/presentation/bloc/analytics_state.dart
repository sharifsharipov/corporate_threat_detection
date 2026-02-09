import 'package:corporate_threat_detection/features/analytics/presentation/models/analytics_view_models.dart';
import 'package:equatable/equatable.dart';

class AnalyticsState extends Equatable {
  final bool isLoading;
  final Map<String, MetricData> metrics;
  final List<MonthlyTrendData> trends;
  final Map<String, AttackVectorData> attackVectors;
  final ResponseTimeData responseTime;
  final String? errorMessage;

  const AnalyticsState({
    required this.isLoading,
    required this.metrics,
    required this.trends,
    required this.attackVectors,
    required this.responseTime,
    required this.errorMessage,
  });

  factory AnalyticsState.initial() => AnalyticsState(
    isLoading: false,
    metrics: const {},
    trends: const [],
    attackVectors: const {},
    responseTime: const ResponseTimeData(averageMs: 0, minMs: 0, maxMs: 0),
    errorMessage: null,
  );

  AnalyticsState copyWith({
    bool? isLoading,
    Map<String, MetricData>? metrics,
    List<MonthlyTrendData>? trends,
    Map<String, AttackVectorData>? attackVectors,
    ResponseTimeData? responseTime,
    String? errorMessage,
  }) {
    return AnalyticsState(
      isLoading: isLoading ?? this.isLoading,
      metrics: metrics ?? this.metrics,
      trends: trends ?? this.trends,
      attackVectors: attackVectors ?? this.attackVectors,
      responseTime: responseTime ?? this.responseTime,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => <Object?>[
    isLoading,
    metrics,
    trends,
    attackVectors,
    responseTime,
    errorMessage,
  ];
}
