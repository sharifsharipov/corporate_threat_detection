import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/features/analytics/data/models/recent_report_model/recent_report_model.dart';
import 'package:corporate_threat_detection/features/analytics/domain/repository/reports_repository.dart';

class StreamRecentReportsUseCase {
  final ReportsRepository repository;

  StreamRecentReportsUseCase({required this.repository});

  Stream<Either<Failure, List<RecentReportModel>>> call() =>
      repository.streamRecentReports();
}
