import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/exeption.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/features/analytics/data/data_source/analytics_data_source.dart';
import 'package:corporate_threat_detection/features/analytics/data/models/attack_vector_model/attack_vector_model.dart';
import 'package:corporate_threat_detection/features/analytics/data/models/monthly_trend_model/monthly_trend_model.dart';
import 'package:corporate_threat_detection/features/analytics/data/models/performance_metric_model/performance_metric_model.dart';
import 'package:corporate_threat_detection/features/analytics/data/models/response_time_model/response_time_model.dart';
import 'package:corporate_threat_detection/features/analytics/domain/repository/analytics_repository.dart';
import 'package:firebase_core/firebase_core.dart';

class AnalyticsRepositoryImpl implements AnalyticsRepository {
  final AnalyticsDataSource dataSource;

  AnalyticsRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<PerformanceMetricModel>>>
  getPerformanceMetrics() async {
    try {
      final metrics = await dataSource.getPerformanceMetrics();
      return Right(metrics);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on FirebaseException catch (e) {
      return Left(ServerFailure(message: e.message ?? e.code));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Stream<Either<Failure, List<PerformanceMetricModel>>>
  streamPerformanceMetrics() {
    try {
      return dataSource.streamPerformanceMetrics().map(
            (metrics) => Right<Failure, List<PerformanceMetricModel>>(metrics),
          );
    } on FirebaseException catch (e) {
      return Stream.value(Left(ServerFailure(message: e.message ?? e.code)));
    } catch (e) {
      return Stream.value(Left(UnexpectedFailure(message: e.toString())));
    }
  }

  @override
  Future<Either<Failure, List<MonthlyTrendModel>>> getMonthlyTrends() async {
    try {
      final trends = await dataSource.getMonthlyTrends();
      return Right(trends);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on FirebaseException catch (e) {
      return Left(ServerFailure(message: e.message ?? e.code));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Stream<Either<Failure, List<MonthlyTrendModel>>> streamMonthlyTrends() {
    try {
      return dataSource
          .streamMonthlyTrends()
          .map((trends) => Right<Failure, List<MonthlyTrendModel>>(trends));
    } on FirebaseException catch (e) {
      return Stream.value(Left(ServerFailure(message: e.message ?? e.code)));
    } catch (e) {
      return Stream.value(Left(UnexpectedFailure(message: e.toString())));
    }
  }

  @override
  Future<Either<Failure, List<AttackVectorModel>>> getAttackVectors() async {
    try {
      final vectors = await dataSource.getAttackVectors();
      return Right(vectors);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on FirebaseException catch (e) {
      return Left(ServerFailure(message: e.message ?? e.code));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Stream<Either<Failure, List<AttackVectorModel>>> streamAttackVectors() {
    try {
      return dataSource
          .streamAttackVectors()
          .map((vectors) => Right<Failure, List<AttackVectorModel>>(vectors));
    } on FirebaseException catch (e) {
      return Stream.value(Left(ServerFailure(message: e.message ?? e.code)));
    } catch (e) {
      return Stream.value(Left(UnexpectedFailure(message: e.toString())));
    }
  }

  @override
  Future<Either<Failure, ResponseTimeModel>> getResponseTime() async {
    try {
      final response = await dataSource.getResponseTime();
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on FirebaseException catch (e) {
      return Left(ServerFailure(message: e.message ?? e.code));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Stream<Either<Failure, ResponseTimeModel>> streamResponseTime() {
    try {
      return dataSource
          .streamResponseTime()
          .map((response) => Right<Failure, ResponseTimeModel>(response));
    } on FirebaseException catch (e) {
      return Stream.value(Left(ServerFailure(message: e.message ?? e.code)));
    } catch (e) {
      return Stream.value(Left(UnexpectedFailure(message: e.toString())));
    }
  }
}
