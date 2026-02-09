import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/exeption.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/features/logs/data/data_source/logs_data_source.dart';
import 'package:corporate_threat_detection/features/logs/data/models/system_log_model/system_log_model.dart';
import 'package:corporate_threat_detection/features/logs/domain/repository/logs_repository.dart';
import 'package:firebase_core/firebase_core.dart';

class LogsRepositoryImpl implements LogsRepository {
  final LogsDataSource dataSource;

  LogsRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<SystemLogModel>>> getSystemLogs({
    int limit = 200,
  }) async {
    try {
      final logs = await dataSource.getSystemLogs(limit: limit);
      return Right(logs);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on FirebaseException catch (e) {
      return Left(ServerFailure(message: e.message ?? e.code));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Stream<Either<Failure, List<SystemLogModel>>> streamSystemLogs({
    int limit = 200,
  }) {
    try {
      return dataSource
          .streamSystemLogs(limit: limit)
          .map<Either<Failure, List<SystemLogModel>>>((logs) => Right(logs));
    } on FirebaseException catch (e) {
      return Stream.value(Left(ServerFailure(message: e.message ?? e.code)));
    } catch (e) {
      return Stream.value(Left(UnexpectedFailure(message: e.toString())));
    }
  }

  @override
  Stream<Either<Failure, List<SystemLogModel>>> streamSystemLogsByLevel(
    LogLevel level, {
    int limit = 200,
  }) {
    try {
      return dataSource
          .streamSystemLogsByLevel(level, limit: limit)
          .map<Either<Failure, List<SystemLogModel>>>((logs) => Right(logs));
    } on FirebaseException catch (e) {
      return Stream.value(Left(ServerFailure(message: e.message ?? e.code)));
    } catch (e) {
      return Stream.value(Left(UnexpectedFailure(message: e.toString())));
    }
  }
}
