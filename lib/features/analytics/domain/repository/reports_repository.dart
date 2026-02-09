import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/features/analytics/data/models/report_type_model/report_type_model.dart';
import 'package:corporate_threat_detection/features/analytics/data/models/recent_report_model/recent_report_model.dart';

abstract class ReportsRepository {
  Stream<Either<Failure, List<ReportTypeModel>>> streamReportTypes();
  Stream<Either<Failure, List<RecentReportModel>>> streamRecentReports();
}
