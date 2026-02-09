import 'package:corporate_threat_detection/features/analytics/data/models/report_type_model/report_type_model.dart';
import 'package:corporate_threat_detection/features/analytics/data/models/recent_report_model/recent_report_model.dart';

abstract class ReportsDataSource {
  Stream<List<ReportTypeModel>> streamReportTypes();
  Stream<List<RecentReportModel>> streamRecentReports();
}
