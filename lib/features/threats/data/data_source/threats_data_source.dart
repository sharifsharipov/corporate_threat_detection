import 'package:corporate_threat_detection/features/threats/data/models/threat/threat.dart';

abstract class ThreatsDataSource {
  Future<List<Threat>> getThreats();
  Stream<List<Threat>> streamThreats();
  Stream<List<Threat>> streamThreatsByStatus(String status);
  Future<Threat> getThreatById(String id);
  Future<void> updateThreatStatus(String id, String status);
}
