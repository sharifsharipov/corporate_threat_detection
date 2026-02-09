import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/features/dashboard/data/models/threat_summary_model/threat_summary_model.dart';
import 'package:corporate_threat_detection/features/dashboard/domain/repository/dashboard_repository.dart';

class StreamThreatSummaryUseCase {
  final DashboardRepository repository;

  StreamThreatSummaryUseCase({required this.repository});

  Stream<Either<Failure, ThreatSummaryModel>> call() {
    return repository.streamThreatSummary();
  }
}
