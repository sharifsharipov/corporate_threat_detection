import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/features/methods/data/models/detection_method/detection_method.dart';

abstract class MethodsRepository {
  Stream<Either<Failure, List<DetectionMethod>>> streamMethods({
    String? type,
    int limit = 200,
  });
}
