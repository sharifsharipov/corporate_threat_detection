import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/features/dashboard/data/models/alert_model/alert_model.dart';
import 'package:corporate_threat_detection/features/dashboard/data/models/realtime_metric_model/realtime_metric_model.dart';
import 'package:corporate_threat_detection/features/dashboard/data/models/stat_model/stat_model.dart';
import 'package:corporate_threat_detection/features/dashboard/data/models/threat_summary_model/threat_summary_model.dart';


abstract class DashboardRepository {
  Future<Either<Failure, List<StatModel>>> getDashboardStats();
  Future<Either<Failure, List<AlertModel>>> getRecentAlerts();
  Future<Either<Failure, List<RealtimeMetricModel>>> getRealtimeMetrics();
  Future<Either<Failure, ThreatSummaryModel>> getThreatSummary();
}
