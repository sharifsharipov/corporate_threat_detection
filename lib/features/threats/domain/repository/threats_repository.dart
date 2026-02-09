import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/features/threats/data/models/threat/threat.dart';

abstract class ThreatsRepository {
  Future<Either<Failure, List<Threat>>> getThreats();
  Stream<Either<Failure, List<Threat>>> streamThreats();
  Stream<Either<Failure, List<Threat>>> streamThreatsByStatus(String status);
  Future<Either<Failure, Threat>> getThreatById(String id);
  Future<Either<Failure, void>> updateThreatStatus(String id, String status);
}
