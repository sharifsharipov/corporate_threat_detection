import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/exeption.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/features/methods/data/data_source/methods_data_source.dart';
import 'package:corporate_threat_detection/features/methods/data/models/detection_method/detection_method.dart';
import 'package:corporate_threat_detection/features/methods/domain/repository/methods_repository.dart';
import 'package:firebase_core/firebase_core.dart';

class MethodsRepositoryImpl implements MethodsRepository {
  final MethodsDataSource dataSource;

  MethodsRepositoryImpl({required this.dataSource});

  @override
  Stream<Either<Failure, List<DetectionMethod>>> streamMethods({
    String? type,
    int limit = 200,
  }) {
    try {
      return dataSource.streamMethods(type: type, limit: limit).map(
            (methods) =>
                Right<Failure, List<DetectionMethod>>(methods),
          );
    } on FirebaseException catch (e) {
      return Stream.value(Left(ServerFailure(message: e.message ?? e.code)));
    } on ServerException catch (e) {
      return Stream.value(Left(ServerFailure(message: e.message)));
    } catch (e) {
      return Stream.value(Left(UnexpectedFailure(message: e.toString())));
    }
  }
}
