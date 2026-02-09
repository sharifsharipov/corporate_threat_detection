import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/features/dashboard/domain/repository/dashboard_repository.dart';

class StreamRealtimeActivityUseCase {
  final DashboardRepository repository;

  StreamRealtimeActivityUseCase({required this.repository});

  Stream<Either<Failure, List<int>>> call() {
    return repository.streamRealtimeActivity();
  }
}
