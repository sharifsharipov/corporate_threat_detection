import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/features/dashboard/data/models/threat_map_location_model/threat_map_location_model.dart';
import 'package:corporate_threat_detection/features/dashboard/domain/repository/dashboard_repository.dart';

class StreamThreatMapLocationsUseCase {
  final DashboardRepository repository;

  StreamThreatMapLocationsUseCase({required this.repository});

  Stream<Either<Failure, List<ThreatMapLocationModel>>> call({
    int limit = 20,
  }) {
    return repository.streamThreatMapLocations(limit: limit);
  }
}
