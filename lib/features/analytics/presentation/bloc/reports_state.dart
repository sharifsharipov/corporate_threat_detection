import 'package:corporate_threat_detection/features/analytics/presentation/models/reports_view_models.dart';
import 'package:equatable/equatable.dart';

class ReportsState extends Equatable {
  final bool isLoading;
  final List<ReportTypeData> reportTypes;
  final List<RecentReportData> recentReports;
  final String? errorMessage;

  const ReportsState({
    required this.isLoading,
    required this.reportTypes,
    required this.recentReports,
    required this.errorMessage,
  });

  factory ReportsState.initial() => const ReportsState(
    isLoading: false,
    reportTypes: [],
    recentReports: [],
    errorMessage: null,
  );

  ReportsState copyWith({
    bool? isLoading,
    List<ReportTypeData>? reportTypes,
    List<RecentReportData>? recentReports,
    String? errorMessage,
  }) {
    return ReportsState(
      isLoading: isLoading ?? this.isLoading,
      reportTypes: reportTypes ?? this.reportTypes,
      recentReports: recentReports ?? this.recentReports,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => <Object?>[
    isLoading,
    reportTypes,
    recentReports,
    errorMessage,
  ];
}
