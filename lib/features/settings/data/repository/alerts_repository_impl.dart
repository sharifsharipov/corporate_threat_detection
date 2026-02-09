import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/exeption.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/features/settings/data/data_source/alerts_data_source.dart';
import 'package:corporate_threat_detection/features/settings/data/models/alert_item_model/alert_item_model.dart';
import 'package:corporate_threat_detection/features/settings/domain/repository/alerts_repository.dart';
import 'package:firebase_core/firebase_core.dart';

class AlertsRepositoryImpl implements AlertsRepository {
  final AlertsDataSource dataSource;

  AlertsRepositoryImpl({required this.dataSource});

  @override
  Stream<Either<Failure, List<AlertItemModel>>> streamAlerts({
    int limit = 200,
  }) {
    try {
      return dataSource
          .streamAlerts(limit: limit)
          .map((alerts) => Right<Failure, List<AlertItemModel>>(alerts));
    } on FirebaseException catch (e) {
      return Stream.value(Left(ServerFailure(message: e.message ?? e.code)));
    } catch (e) {
      return Stream.value(Left(UnexpectedFailure(message: e.toString())));
    }
  }

  @override
  Stream<Either<Failure, List<AlertItemModel>>> streamAlertsBySeverity(
    AlertSeverity severity, {
    int limit = 200,
  }) {
    try {
      return dataSource
          .streamAlertsBySeverity(severity, limit: limit)
          .map((alerts) => Right<Failure, List<AlertItemModel>>(alerts));
    } on FirebaseException catch (e) {
      return Stream.value(Left(ServerFailure(message: e.message ?? e.code)));
    } catch (e) {
      return Stream.value(Left(UnexpectedFailure(message: e.toString())));
    }
  }

  @override
  Future<Either<Failure, void>> updateAlertStatus(
    String id,
    AlertStatus status,
  ) async {
    try {
      await dataSource.updateAlertStatus(id, status);
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
