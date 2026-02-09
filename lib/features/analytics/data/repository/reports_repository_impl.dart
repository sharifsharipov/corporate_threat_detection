import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/features/analytics/data/data_source/reports_data_source.dart';
import 'package:corporate_threat_detection/features/analytics/data/models/report_type_model/report_type_model.dart';
import 'package:corporate_threat_detection/features/analytics/data/models/recent_report_model/recent_report_model.dart';
import 'package:corporate_threat_detection/features/analytics/domain/repository/reports_repository.dart';
import 'package:firebase_core/firebase_core.dart';

class ReportsRepositoryImpl implements ReportsRepository {
  final ReportsDataSource dataSource;

  ReportsRepositoryImpl({required this.dataSource});

  @override
  Stream<Either<Failure, List<ReportTypeModel>>> streamReportTypes() {
    try {
      return dataSource
          .streamReportTypes()
          .map((types) => Right<Failure, List<ReportTypeModel>>(types));
    } on FirebaseException catch (e) {
      return Stream.value(Left(ServerFailure(message: e.message ?? e.code)));
    } catch (e) {
      return Stream.value(Left(UnexpectedFailure(message: e.toString())));
    }
  }

  @override
  Stream<Either<Failure, List<RecentReportModel>>> streamRecentReports() {
    try {
      return dataSource
          .streamRecentReports()
          .map((reports) => Right<Failure, List<RecentReportModel>>(reports));
    } on FirebaseException catch (e) {
      return Stream.value(Left(ServerFailure(message: e.message ?? e.code)));
    } catch (e) {
      return Stream.value(Left(UnexpectedFailure(message: e.toString())));
    }
  }
}
