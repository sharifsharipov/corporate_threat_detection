import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/features/methods/data/models/detection_method/detection_method.dart';
import 'package:corporate_threat_detection/features/methods/domain/repository/methods_repository.dart';

class StreamDetectionMethodsUseCase {
  final MethodsRepository repository;

  StreamDetectionMethodsUseCase({required this.repository});

  Stream<Either<Failure, List<DetectionMethod>>> call({
    String? type,
    int limit = 200,
  }) {
    return repository.streamMethods(type: type, limit: limit);
  }
}
