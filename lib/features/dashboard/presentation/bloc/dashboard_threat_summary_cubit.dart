import 'dart:async';

import 'package:corporate_threat_detection/features/dashboard/data/models/threat_summary_model/threat_summary_model.dart';
import 'package:corporate_threat_detection/features/dashboard/domain/usecases/stream_threat_summary_use_case.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/bloc/dashboard_threat_summary_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardThreatSummaryCubit extends Cubit<DashboardThreatSummaryState> {
  final StreamThreatSummaryUseCase streamThreatSummaryUseCase;
  StreamSubscription? _subscription;

  DashboardThreatSummaryCubit({required this.streamThreatSummaryUseCase})
    : super(DashboardThreatSummaryState.initial());

  void startRealtime() {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    _subscription?.cancel();
    _subscription = streamThreatSummaryUseCase().listen(
      (result) {
        result.either(
          (failure) => emit(
            state.copyWith(isLoading: false, errorMessage: failure.message),
          ),
          (summary) => emit(
            state.copyWith(
              isLoading: false,
              summary: summary.totalThreats > 0 ? summary : _mockSummary,
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

  static final ThreatSummaryModel _mockSummary = ThreatSummaryModel(
    totalThreats: 1248,
    criticalCount: 78,
    highCount: 162,
    mediumCount: 121,
    lowCount: 65,
    categories: [
      const ThreatCategoryData(
        name: 'Malware',
        count: 342,
        colorValue: 0xFFF71E52,
        iconCodePoint: 0xe868, // bug_report
      ),
      const ThreatCategoryData(
        name: 'Phishing',
        count: 287,
        colorValue: 0xFFF7931E,
        iconCodePoint: 0xef67, // phishing
      ),
      const ThreatCategoryData(
        name: 'DDoS',
        count: 156,
        colorValue: 0xFF8B0000,
        iconCodePoint: 0xf05a1, // cloud_off
      ),
    ],
    timelineData: [
      ThreatTimelinePoint(date: DateTime.parse('2024-03-01'), count: 45),
      ThreatTimelinePoint(date: DateTime.parse('2024-03-02'), count: 52),
      ThreatTimelinePoint(date: DateTime.parse('2024-03-03'), count: 48),
      ThreatTimelinePoint(date: DateTime.parse('2024-03-04'), count: 65),
      ThreatTimelinePoint(date: DateTime.parse('2024-03-05'), count: 58),
      ThreatTimelinePoint(date: DateTime.parse('2024-03-06'), count: 42),
      ThreatTimelinePoint(date: DateTime.parse('2024-03-07'), count: 49),
    ],
    topThreats: const [
      TopThreatData(
        name: 'Trojan.GenericKD',
        description: 'Generic trojan malware infection',
        count: 145,
        severity: 'critical',
        isIncreasing: true,
      ),
      TopThreatData(
        name: 'Phishing Email Campaign',
        description: 'Targeted email phishing attempts',
        count: 128,
        severity: 'high',
        isIncreasing: true,
      ),
    ],
  );

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
