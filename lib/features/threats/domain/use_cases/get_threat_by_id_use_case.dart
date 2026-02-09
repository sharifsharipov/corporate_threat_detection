import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/core/usecase/usecase.dart';
import 'package:corporate_threat_detection/features/threats/data/models/threat/threat.dart';
import 'package:corporate_threat_detection/features/threats/domain/repository/threats_repository.dart';

class GetThreatByIdParams {
  final String id;

  GetThreatByIdParams({required this.id});
}

class GetThreatByIdUseCase extends UseCase<Threat, GetThreatByIdParams> {
  final ThreatsRepository repository;

  GetThreatByIdUseCase({required this.repository});

  @override
  Future<Either<Failure, Threat>> call(GetThreatByIdParams params) =>
      repository.getThreatById(params.id);
}
