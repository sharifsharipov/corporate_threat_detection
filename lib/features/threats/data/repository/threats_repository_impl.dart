import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/exeption.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/features/threats/data/data_source/threats_data_source.dart';
import 'package:corporate_threat_detection/features/threats/data/models/threat/threat.dart';
import 'package:corporate_threat_detection/features/threats/domain/repository/threats_repository.dart';
import 'package:firebase_core/firebase_core.dart';

class ThreatsRepositoryImpl implements ThreatsRepository {
  final ThreatsDataSource dataSource;

  ThreatsRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<Threat>>> getThreats() async {
    try {
      final threats = await dataSource.getThreats();
      return Right(threats);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on FirebaseException catch (e) {
      return Left(ServerFailure(message: e.message ?? e.code));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Stream<Either<Failure, List<Threat>>> streamThreats() {
    try {
      return dataSource.streamThreats().map<Either<Failure, List<Threat>>>(
        (threats) => Right(threats),
      );
    } on FirebaseException catch (e) {
      return Stream.value(Left(ServerFailure(message: e.message ?? e.code)));
    } catch (e) {
      return Stream.value(Left(UnexpectedFailure(message: e.toString())));
    }
  }

  @override
  Stream<Either<Failure, List<Threat>>> streamThreatsByStatus(String status) {
    try {
      return dataSource
          .streamThreatsByStatus(status)
          .map<Either<Failure, List<Threat>>>((threats) => Right(threats));
    } on FirebaseException catch (e) {
      return Stream.value(Left(ServerFailure(message: e.message ?? e.code)));
    } catch (e) {
      return Stream.value(Left(UnexpectedFailure(message: e.toString())));
    }
  }

  @override
  Future<Either<Failure, Threat>> getThreatById(String id) async {
    try {
      final threat = await dataSource.getThreatById(id);
      return Right(threat);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on FirebaseException catch (e) {
      return Left(ServerFailure(message: e.message ?? e.code));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateThreatStatus(
    String id,
    String status,
  ) async {
    try {
      await dataSource.updateThreatStatus(id, status);
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
