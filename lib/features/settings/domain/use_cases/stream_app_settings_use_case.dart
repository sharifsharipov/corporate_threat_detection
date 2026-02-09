import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/features/settings/data/models/app_setting_model/app_setting_model.dart';
import 'package:corporate_threat_detection/features/settings/domain/repository/settings_repository.dart';

class StreamAppSettingsUseCase {
  final SettingsRepository repository;

  StreamAppSettingsUseCase({required this.repository});

  Stream<Either<Failure, List<AppSettingModel>>> call() =>
      repository.streamAppSettings();
}
