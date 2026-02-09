import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/features/dashboard/data/models/stat_model/stat_model.dart';
import 'package:corporate_threat_detection/features/dashboard/domain/repository/dashboard_repository.dart';

class StreamDashboardStatsUseCase {
  final DashboardRepository repository;

  StreamDashboardStatsUseCase({required this.repository});

  Stream<Either<Failure, List<StatModel>>> call() {
    return repository.streamDashboardStats();
  }
}
