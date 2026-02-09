import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/exeption.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/features/logs/data/data_source/history_data_source.dart';
import 'package:corporate_threat_detection/features/logs/data/models/history_event_model/history_event_model.dart';
import 'package:corporate_threat_detection/features/logs/domain/repository/history_repository.dart';
import 'package:firebase_core/firebase_core.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  final HistoryDataSource dataSource;

  HistoryRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<HistoryEventModel>>> getHistoryEvents({
    int limit = 200,
  }) async {
    try {
      final events = await dataSource.getHistoryEvents(limit: limit);
      return Right(events);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on FirebaseException catch (e) {
      return Left(ServerFailure(message: e.message ?? e.code));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Stream<Either<Failure, List<HistoryEventModel>>> streamHistoryEvents({
    int limit = 200,
  }) {
    try {
      return dataSource
          .streamHistoryEvents(limit: limit)
          .map((events) => Right<Failure, List<HistoryEventModel>>(events));
    } on FirebaseException catch (e) {
      return Stream.value(Left(ServerFailure(message: e.message ?? e.code)));
    } catch (e) {
      return Stream.value(Left(UnexpectedFailure(message: e.toString())));
    }
  }

  @override
  Stream<Either<Failure, List<HistoryEventModel>>>
  streamHistoryEventsBySeverity(
    EventSeverity severity, {
    int limit = 200,
  }) {
    try {
      return dataSource
          .streamHistoryEventsBySeverity(severity, limit: limit)
          .map((events) => Right<Failure, List<HistoryEventModel>>(events));
    } on FirebaseException catch (e) {
      return Stream.value(Left(ServerFailure(message: e.message ?? e.code)));
    } catch (e) {
      return Stream.value(Left(UnexpectedFailure(message: e.toString())));
    }
  }
}
