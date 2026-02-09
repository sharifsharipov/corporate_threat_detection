import 'package:corporate_threat_detection/features/methods/data/models/detection_method/detection_method.dart';

abstract class MethodsDataSource {
  Stream<List<DetectionMethod>> streamMethods({String? type, int limit = 200});
}
