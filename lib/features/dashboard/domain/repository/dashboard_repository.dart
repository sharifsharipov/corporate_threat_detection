import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/features/dashboard/data/models/alert_model/alert_model.dart';
import 'package:corporate_threat_detection/features/dashboard/data/models/realtime_metric_model/realtime_metric_model.dart';
import 'package:corporate_threat_detection/features/dashboard/data/models/stat_model/stat_model.dart';
import 'package:corporate_threat_detection/features/dashboard/data/models/threat_summary_model/threat_summary_model.dart';
import 'package:corporate_threat_detection/features/dashboard/data/models/threat_feed_model/threat_feed_model.dart';
import 'package:corporate_threat_detection/features/dashboard/data/models/threat_map_location_model/threat_map_location_model.dart';


abstract class DashboardRepository {
  Future<Either<Failure, List<StatModel>>> getDashboardStats();
  Future<Either<Failure, List<AlertModel>>> getRecentAlerts();
  Future<Either<Failure, List<RealtimeMetricModel>>> getRealtimeMetrics();
  Future<Either<Failure, ThreatSummaryModel>> getThreatSummary();
  Stream<Either<Failure, List<StatModel>>> streamDashboardStats();
  Stream<Either<Failure, List<AlertModel>>> streamRecentAlerts({int limit = 10});
  Stream<Either<Failure, List<RealtimeMetricModel>>> streamRealtimeMetrics();
  Stream<Either<Failure, ThreatSummaryModel>> streamThreatSummary();
  Stream<Either<Failure, List<int>>> streamRealtimeActivity();
  Stream<Either<Failure, List<ThreatFeedModel>>> streamThreatFeed({
    int limit = 20,
  });
  Stream<Either<Failure, List<ThreatMapLocationModel>>>
      streamThreatMapLocations({int limit = 20});
}
