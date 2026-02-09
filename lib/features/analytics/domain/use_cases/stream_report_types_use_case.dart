import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/features/analytics/data/models/report_type_model/report_type_model.dart';
import 'package:corporate_threat_detection/features/analytics/domain/repository/reports_repository.dart';

class StreamReportTypesUseCase {
  final ReportsRepository repository;

  StreamReportTypesUseCase({required this.repository});

  Stream<Either<Failure, List<ReportTypeModel>>> call() =>
      repository.streamReportTypes();
}
