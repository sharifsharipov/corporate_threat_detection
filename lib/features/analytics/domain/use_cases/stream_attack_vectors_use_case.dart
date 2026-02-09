import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/features/analytics/data/models/attack_vector_model/attack_vector_model.dart';
import 'package:corporate_threat_detection/features/analytics/domain/repository/analytics_repository.dart';

class StreamAttackVectorsUseCase {
  final AnalyticsRepository repository;

  StreamAttackVectorsUseCase({required this.repository});

  Stream<Either<Failure, List<AttackVectorModel>>> call() =>
      repository.streamAttackVectors();
}
