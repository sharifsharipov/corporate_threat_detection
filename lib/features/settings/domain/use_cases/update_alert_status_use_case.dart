import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/features/settings/data/models/alert_item_model/alert_item_model.dart';
import 'package:corporate_threat_detection/features/settings/domain/repository/alerts_repository.dart';

class UpdateAlertStatusUseCase {
  final AlertsRepository repository;

  UpdateAlertStatusUseCase({required this.repository});

  Future<Either<Failure, void>> call(String id, AlertStatus status) =>
      repository.updateAlertStatus(id, status);
}
