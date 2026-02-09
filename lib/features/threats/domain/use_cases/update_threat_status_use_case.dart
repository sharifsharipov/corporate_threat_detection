import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/core/usecase/usecase.dart';
import 'package:corporate_threat_detection/features/threats/domain/repository/threats_repository.dart';

class UpdateThreatStatusParams {
  final String id;
  final String status;

  UpdateThreatStatusParams({required this.id, required this.status});
}

class UpdateThreatStatusUseCase
    extends UseCase<void, UpdateThreatStatusParams> {
  final ThreatsRepository repository;

  UpdateThreatStatusUseCase({required this.repository});

  @override
  Future<Either<Failure, void>> call(UpdateThreatStatusParams params) =>
      repository.updateThreatStatus(params.id, params.status);
}
