import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/core/usecase/usecase.dart';
import 'package:corporate_threat_detection/features/threats/data/models/threat/threat.dart';
import 'package:corporate_threat_detection/features/threats/domain/repository/threats_repository.dart';

class GetThreatsUseCase extends UseCase<List<Threat>, NoParams> {
  final ThreatsRepository repository;

  GetThreatsUseCase({required this.repository});

  @override
  Future<Either<Failure, List<Threat>>> call(NoParams params) =>
      repository.getThreats();
}
