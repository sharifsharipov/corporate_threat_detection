import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/core/usecase/usecase.dart';
import 'package:corporate_threat_detection/features/threats/data/models/threat/threat.dart';
import 'package:corporate_threat_detection/features/threats/domain/repository/threats_repository.dart';

class StreamThreatsUseCase {
  final ThreatsRepository repository;

  StreamThreatsUseCase({required this.repository});

  Stream<Either<Failure, List<Threat>>> call(NoParams params) =>
      repository.streamThreats();
}
