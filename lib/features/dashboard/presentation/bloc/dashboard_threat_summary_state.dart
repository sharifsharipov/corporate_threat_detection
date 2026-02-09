import 'package:corporate_threat_detection/features/dashboard/data/models/threat_summary_model/threat_summary_model.dart';
import 'package:equatable/equatable.dart';

class DashboardThreatSummaryState extends Equatable {
  final bool isLoading;
  final ThreatSummaryModel? summary;
  final String? errorMessage;

  const DashboardThreatSummaryState({
    required this.isLoading,
    required this.summary,
    required this.errorMessage,
  });

  factory DashboardThreatSummaryState.initial() =>
      const DashboardThreatSummaryState(
        isLoading: false,
        summary: null,
        errorMessage: null,
      );

  DashboardThreatSummaryState copyWith({
    bool? isLoading,
    ThreatSummaryModel? summary,
    String? errorMessage,
  }) {
    return DashboardThreatSummaryState(
      isLoading: isLoading ?? this.isLoading,
      summary: summary ?? this.summary,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => <Object?>[isLoading, summary, errorMessage];
}
