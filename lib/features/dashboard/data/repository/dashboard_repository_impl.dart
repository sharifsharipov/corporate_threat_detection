import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/exeption.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/features/dashboard/data/data_source/dashboard_remote_data_source.dart';
import 'package:corporate_threat_detection/features/dashboard/data/models/alert_model/alert_model.dart';
import 'package:corporate_threat_detection/features/dashboard/data/models/realtime_metric_model/realtime_metric_model.dart';
import 'package:corporate_threat_detection/features/dashboard/data/models/stat_model/stat_model.dart';
import 'package:corporate_threat_detection/features/dashboard/data/models/threat_summary_model/threat_summary_model.dart';
import 'package:corporate_threat_detection/features/dashboard/domain/repository/dashboard_repository.dart';


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
}
