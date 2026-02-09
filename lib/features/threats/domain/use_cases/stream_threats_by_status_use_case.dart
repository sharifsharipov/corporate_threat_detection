import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/features/threats/data/models/threat/threat.dart';
import 'package:corporate_threat_detection/features/threats/domain/repository/threats_repository.dart';

class StreamThreatsByStatusParams {
  final String status;

  StreamThreatsByStatusParams({required this.status});
}

class StreamThreatsByStatusUseCase {
  final ThreatsRepository repository;

  StreamThreatsByStatusUseCase({required this.repository});

  Stream<Either<Failure, List<Threat>>> call(
    StreamThreatsByStatusParams params,
  ) =>
      repository.streamThreatsByStatus(params.status);
}
