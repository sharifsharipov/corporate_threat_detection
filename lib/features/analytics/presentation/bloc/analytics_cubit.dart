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

    _metricsSub = streamPerformanceMetricsUseCase().listen((result) {
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
    }, onError: (Object error) {
      emit(state.copyWith(isLoading: false, errorMessage: error.toString()));
    });

    _trendsSub = streamMonthlyTrendsUseCase().listen((result) {
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
    }, onError: (Object error) {
      emit(state.copyWith(isLoading: false, errorMessage: error.toString()));
    });

    _vectorsSub = streamAttackVectorsUseCase().listen((result) {
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
    }, onError: (Object error) {
      emit(state.copyWith(isLoading: false, errorMessage: error.toString()));
    });

    _responseSub = streamResponseTimeUseCase().listen((result) {
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
    }, onError: (Object error) {
      emit(state.copyWith(isLoading: false, errorMessage: error.toString()));
    });
  }

  Map<String, MetricData> _mapMetrics(
    List<PerformanceMetricModel> metrics,
  ) {
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

    if (mapped.isEmpty) {
      return {
        'Detection Rate': MetricData(
          value: '0%',
          icon: Icons.shield_outlined,
          color: AppColors.c_03A64B,
          changePercentage: 0,
          isIncrease: true,
        ),
      };
    }

    return mapped;
  }

  List<MonthlyTrendData> _mapTrends(List<MonthlyTrendModel> trends) {
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

  Map<String, AttackVectorData> _mapVectors(
    List<AttackVectorModel> vectors,
  ) {
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
    return ResponseTimeData(
      averageMs: response.averageMs,
      minMs: response.minMs,
      maxMs: response.maxMs,
    );
  }

  @override
  Future<void> close() {
    _metricsSub?.cancel();
    _trendsSub?.cancel();
    _vectorsSub?.cancel();
    _responseSub?.cancel();
    return super.close();
  }
}
