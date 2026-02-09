import 'dart:async';

import 'package:corporate_threat_detection/core/themes/colors/app_colors.dart';
import 'package:corporate_threat_detection/features/analytics/data/models/attack_vector_model/attack_vector_model.dart';
import 'package:corporate_threat_detection/features/analytics/data/models/monthly_trend_model/monthly_trend_model.dart';
import 'package:corporate_threat_detection/features/analytics/data/models/performance_metric_model/performance_metric_model.dart';
import 'package:corporate_threat_detection/features/analytics/data/models/response_time_model/response_time_model.dart';
import 'package:corporate_threat_detection/features/analytics/domain/use_cases/stream_attack_vectors_use_case.dart';
import 'package:corporate_threat_detection/features/analytics/domain/use_cases/stream_monthly_trends_use_case.dart';
import 'package:corporate_threat_detection/features/analytics/domain/use_cases/stream_performance_metrics_use_case.dart';
import 'package:corporate_threat_detection/features/analytics/domain/use_cases/stream_response_time_use_case.dart';
import 'package:corporate_threat_detection/features/analytics/presentation/bloc/analytics_state.dart';
import 'package:corporate_threat_detection/features/analytics/presentation/models/analytics_view_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnalyticsCubit extends Cubit<AnalyticsState> {
  final StreamPerformanceMetricsUseCase streamPerformanceMetricsUseCase;
  final StreamMonthlyTrendsUseCase streamMonthlyTrendsUseCase;
  final StreamAttackVectorsUseCase streamAttackVectorsUseCase;
  final StreamResponseTimeUseCase streamResponseTimeUseCase;

  StreamSubscription? _metricsSub;
  StreamSubscription? _trendsSub;
  StreamSubscription? _vectorsSub;
  StreamSubscription? _responseSub;

  AnalyticsCubit({
    required this.streamPerformanceMetricsUseCase,
    required this.streamMonthlyTrendsUseCase,
    required this.streamAttackVectorsUseCase,
    required this.streamResponseTimeUseCase,
  }) : super(AnalyticsState.initial());

  void startRealtime() {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    _metricsSub?.cancel();
    _trendsSub?.cancel();
    _vectorsSub?.cancel();
    _responseSub?.cancel();

    _metricsSub = streamPerformanceMetricsUseCase().listen(
      (result) {
        result.either(
          (failure) => emit(
            state.copyWith(isLoading: false, errorMessage: failure.message),
          ),
          (metrics) => emit(
            state.copyWith(
              isLoading: false,
              metrics: _mapMetrics(metrics),
              errorMessage: null,
            ),
          ),
        );
      },
      onError: (Object error) {
        emit(state.copyWith(isLoading: false, errorMessage: error.toString()));
      },
    );

    _trendsSub = streamMonthlyTrendsUseCase().listen(
      (result) {
        result.either(
          (failure) => emit(
            state.copyWith(isLoading: false, errorMessage: failure.message),
          ),
          (trends) => emit(
            state.copyWith(
              isLoading: false,
              trends: _mapTrends(trends),
              errorMessage: null,
            ),
          ),
        );
      },
      onError: (Object error) {
        emit(state.copyWith(isLoading: false, errorMessage: error.toString()));
      },
    );

    _vectorsSub = streamAttackVectorsUseCase().listen(
      (result) {
        result.either(
          (failure) => emit(
            state.copyWith(isLoading: false, errorMessage: failure.message),
          ),
          (vectors) => emit(
            state.copyWith(
              isLoading: false,
              attackVectors: _mapVectors(vectors),
              errorMessage: null,
            ),
          ),
        );
      },
      onError: (Object error) {
        emit(state.copyWith(isLoading: false, errorMessage: error.toString()));
      },
    );

    _responseSub = streamResponseTimeUseCase().listen(
      (result) {
        result.either(
          (failure) => emit(
            state.copyWith(isLoading: false, errorMessage: failure.message),
          ),
          (response) => emit(
            state.copyWith(
              isLoading: false,
              responseTime: _mapResponseTime(response),
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

  Map<String, MetricData> _mapMetrics(List<PerformanceMetricModel> metrics) {
    if (metrics.isEmpty) {
      return _mockMetrics;
    }
    final Map<String, MetricData> mapped = {};
    for (final metric in metrics) {
      mapped[metric.title] = MetricData(
        value: metric.value,
        icon: IconData(metric.iconCodePoint, fontFamily: 'MaterialIcons'),
        color: Color(metric.colorValue),
        changePercentage: metric.changePercentage,
        isIncrease: metric.isIncrease,
      );
    }
    return mapped;
  }

  List<MonthlyTrendData> _mapTrends(List<MonthlyTrendModel> trends) {
    if (trends.isEmpty) {
      return _mockTrendData;
    }
    return trends
        .map(
          (trend) => MonthlyTrendData(
            month: trend.month,
            detected: trend.detected,
            blocked: trend.blocked,
            falsePositives: trend.falsePositives,
          ),
        )
        .toList();
  }

  Map<String, AttackVectorData> _mapVectors(List<AttackVectorModel> vectors) {
    if (vectors.isEmpty) {
      return _mockAttackVectors;
    }
    final Map<String, AttackVectorData> mapped = {};
    for (final vector in vectors) {
      mapped[vector.name] = AttackVectorData(
        count: vector.count,
        color: Color(vector.colorValue),
      );
    }
    return mapped;
  }

  ResponseTimeData _mapResponseTime(ResponseTimeModel response) {
    if (response.averageMs == 0) {
      return _mockResponseTime;
    }
    return ResponseTimeData(
      averageMs: response.averageMs,
      minMs: response.minMs,
      maxMs: response.maxMs,
    );
  }

  static final Map<String, MetricData> _mockMetrics = {
    'Detection Rate': MetricData(
      value: '98.7%',
      icon: Icons.shield_outlined,
      color: AppColors.c_03A64B,
      changePercentage: 2.3,
      isIncrease: true,
    ),
    'Blocked Threats': MetricData(
      value: '1,247',
      icon: Icons.block,
      color: AppColors.c_F71E52,
      changePercentage: 15.8,
      isIncrease: true,
    ),
    'Avg Response': MetricData(
      value: '245ms',
      icon: Icons.speed,
      color: AppColors.buttonColor,
      changePercentage: 8.2,
      isIncrease: false,
    ),
    'System Uptime': MetricData(
      value: '99.9%',
      icon: Icons.check_circle_outline,
      color: AppColors.c_03A64B,
      changePercentage: 0.1,
      isIncrease: true,
    ),
  };

  static final List<MonthlyTrendData> _mockTrendData = [
    MonthlyTrendData(
      month: 'Jul',
      detected: 890,
      blocked: 875,
      falsePositives: 12,
    ),
    MonthlyTrendData(
      month: 'Aug',
      detected: 920,
      blocked: 902,
      falsePositives: 15,
    ),
    MonthlyTrendData(
      month: 'Sep',
      detected: 1050,
      blocked: 1032,
      falsePositives: 18,
    ),
    MonthlyTrendData(
      month: 'Oct',
      detected: 980,
      blocked: 965,
      falsePositives: 14,
    ),
    MonthlyTrendData(
      month: 'Nov',
      detected: 1120,
      blocked: 1098,
      falsePositives: 20,
    ),
    MonthlyTrendData(
      month: 'Dec',
      detected: 1247,
      blocked: 1230,
      falsePositives: 17,
    ),
  ];

  static final Map<String, AttackVectorData> _mockAttackVectors = {
    'Malware': AttackVectorData(count: 342, color: AppColors.c_F71E52),
    'Phishing': AttackVectorData(count: 287, color: AppColors.c_F7931E),
    'DDoS': AttackVectorData(count: 156, color: const Color(0xFF8B0000)),
    'Ransomware': AttackVectorData(count: 98, color: const Color(0xFF5856D6)),
    'SQL Injection': AttackVectorData(count: 234, color: AppColors.buttonColor),
    'XSS': AttackVectorData(count: 130, color: AppColors.c_03A64B),
  };

  static const ResponseTimeData _mockResponseTime = ResponseTimeData(
    averageMs: 245,
    minMs: 85,
    maxMs: 1250,
  );

  @override
  Future<void> close() {
    _metricsSub?.cancel();
    _trendsSub?.cancel();
    _vectorsSub?.cancel();
    _responseSub?.cancel();
    return super.close();
  }
}
