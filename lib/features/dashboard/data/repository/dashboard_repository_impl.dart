import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/exeption.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/features/dashboard/data/data_source/dashboard_remote_data_source.dart';
import 'package:corporate_threat_detection/features/dashboard/data/models/alert_model/alert_model.dart';
import 'package:corporate_threat_detection/features/dashboard/data/models/realtime_metric_model/realtime_metric_model.dart';
import 'package:corporate_threat_detection/features/dashboard/data/models/stat_model/stat_model.dart';
import 'package:corporate_threat_detection/features/dashboard/data/models/threat_summary_model/threat_summary_model.dart';
import 'package:corporate_threat_detection/features/dashboard/data/models/threat_feed_model/threat_feed_model.dart';
import 'package:corporate_threat_detection/features/dashboard/data/models/threat_map_location_model/threat_map_location_model.dart';
import 'package:corporate_threat_detection/features/dashboard/domain/repository/dashboard_repository.dart';
import 'package:firebase_core/firebase_core.dart';


class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardRemoteDataSource remoteDataSource;

  DashboardRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<StatModel>>> getDashboardStats() async {
    try {
      final stats = await remoteDataSource.getDashboardStats();
      return Right(stats);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<AlertModel>>> getRecentAlerts() async {
    try {
      final alerts = await remoteDataSource.getRecentAlerts();
      return Right(alerts);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RealtimeMetricModel>>>
  getRealtimeMetrics() async {
    try {
      final metrics = await remoteDataSource.getRealtimeMetrics();
      return Right(metrics);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ThreatSummaryModel>> getThreatSummary() async {
    try {
      final summary = await remoteDataSource.getThreatSummary();
      return Right(summary);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Stream<Either<Failure, List<StatModel>>> streamDashboardStats() {
    try {
      return remoteDataSource
          .streamDashboardStats()
          .map((stats) => Right<Failure, List<StatModel>>(stats));
    } on FirebaseException catch (e) {
      return Stream.value(Left(ServerFailure(message: e.message ?? e.code)));
    } catch (e) {
      return Stream.value(Left(ServerFailure(message: e.toString())));
    }
  }

  @override
  Stream<Either<Failure, List<AlertModel>>> streamRecentAlerts({
    int limit = 10,
  }) {
    try {
      return remoteDataSource
          .streamRecentAlerts(limit: limit)
          .map((alerts) => Right<Failure, List<AlertModel>>(alerts));
    } on FirebaseException catch (e) {
      return Stream.value(Left(ServerFailure(message: e.message ?? e.code)));
    } catch (e) {
      return Stream.value(Left(ServerFailure(message: e.toString())));
    }
  }

  @override
  Stream<Either<Failure, List<RealtimeMetricModel>>> streamRealtimeMetrics() {
    try {
      return remoteDataSource
          .streamRealtimeMetrics()
          .map(
            (metrics) =>
                Right<Failure, List<RealtimeMetricModel>>(metrics),
          );
    } on FirebaseException catch (e) {
      return Stream.value(Left(ServerFailure(message: e.message ?? e.code)));
    } catch (e) {
      return Stream.value(Left(ServerFailure(message: e.toString())));
    }
  }

  @override
  Stream<Either<Failure, ThreatSummaryModel>> streamThreatSummary() {
    try {
      return remoteDataSource
          .streamThreatSummary()
          .map((summary) => Right<Failure, ThreatSummaryModel>(summary));
    } on FirebaseException catch (e) {
      return Stream.value(Left(ServerFailure(message: e.message ?? e.code)));
    } catch (e) {
      return Stream.value(Left(ServerFailure(message: e.toString())));
    }
  }

  @override
  Stream<Either<Failure, List<int>>> streamRealtimeActivity() {
    try {
      return remoteDataSource
          .streamRealtimeActivity()
          .map((points) => Right<Failure, List<int>>(points));
    } on FirebaseException catch (e) {
      return Stream.value(Left(ServerFailure(message: e.message ?? e.code)));
    } catch (e) {
      return Stream.value(Left(ServerFailure(message: e.toString())));
    }
  }

  @override
  Stream<Either<Failure, List<ThreatFeedModel>>> streamThreatFeed({
    int limit = 20,
  }) {
    try {
      return remoteDataSource
          .streamThreatFeed(limit: limit)
          .map((feed) => Right<Failure, List<ThreatFeedModel>>(feed));
    } on FirebaseException catch (e) {
      return Stream.value(Left(ServerFailure(message: e.message ?? e.code)));
    } catch (e) {
      return Stream.value(Left(ServerFailure(message: e.toString())));
    }
  }

  @override
  Stream<Either<Failure, List<ThreatMapLocationModel>>>
      streamThreatMapLocations({int limit = 20}) {
    try {
      return remoteDataSource
          .streamThreatMapLocations(limit: limit)
          .map(
            (locations) => Right<Failure, List<ThreatMapLocationModel>>(
              locations,
            ),
          );
    } on FirebaseException catch (e) {
      return Stream.value(Left(ServerFailure(message: e.message ?? e.code)));
    } catch (e) {
      return Stream.value(Left(ServerFailure(message: e.toString())));
    }
  }
}
