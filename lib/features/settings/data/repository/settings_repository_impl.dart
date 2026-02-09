import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/exeption.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/features/settings/data/data_source/settings_data_source.dart';
import 'package:corporate_threat_detection/features/settings/data/models/app_setting_model/app_setting_model.dart';
import 'package:corporate_threat_detection/features/settings/data/models/user_profile_model/user_profile_model.dart';
import 'package:corporate_threat_detection/features/settings/domain/repository/settings_repository.dart';
import 'package:firebase_core/firebase_core.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsDataSource dataSource;

  SettingsRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<AppSettingModel>>> getAppSettings() async {
    try {
      final settings = await dataSource.getAppSettings();
      return Right(settings);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on FirebaseException catch (e) {
      return Left(ServerFailure(message: e.message ?? e.code));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Stream<Either<Failure, List<AppSettingModel>>> streamAppSettings() {
    try {
      return dataSource
          .streamAppSettings()
          .map((settings) => Right<Failure, List<AppSettingModel>>(settings));
    } on FirebaseException catch (e) {
      return Stream.value(Left(ServerFailure(message: e.message ?? e.code)));
    } catch (e) {
      return Stream.value(Left(UnexpectedFailure(message: e.toString())));
    }
  }

  @override
  Future<Either<Failure, UserProfileModel>> getUserProfile(String uid) async {
    try {
      final profile = await dataSource.getUserProfile(uid);
      return Right(profile);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on FirebaseException catch (e) {
      return Left(ServerFailure(message: e.message ?? e.code));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Stream<Either<Failure, UserProfileModel>> streamUserProfile(String uid) {
    try {
      return dataSource
          .streamUserProfile(uid)
          .map((profile) => Right<Failure, UserProfileModel>(profile));
    } on FirebaseException catch (e) {
      return Stream.value(Left(ServerFailure(message: e.message ?? e.code)));
    } catch (e) {
      return Stream.value(Left(UnexpectedFailure(message: e.toString())));
    }
  }

  @override
  Stream<Either<Failure, List<UserProfileModel>>> streamUserProfiles({
    int limit = 200,
  }) {
    try {
      return dataSource
          .streamUserProfiles(limit: limit)
          .map((profiles) => Right<Failure, List<UserProfileModel>>(profiles));
    } on FirebaseException catch (e) {
      return Stream.value(Left(ServerFailure(message: e.message ?? e.code)));
    } catch (e) {
      return Stream.value(Left(UnexpectedFailure(message: e.toString())));
    }
  }

  @override
  Future<Either<Failure, void>> updateSetting(AppSettingModel setting) async {
    try {
      await dataSource.updateSetting(setting);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on FirebaseException catch (e) {
      return Left(ServerFailure(message: e.message ?? e.code));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateUserProfile(
    String uid,
    Map<String, dynamic> data,
  ) async {
    try {
      await dataSource.updateUserProfile(uid, data);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on FirebaseException catch (e) {
      return Left(ServerFailure(message: e.message ?? e.code));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }
}
