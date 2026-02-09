import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/exeption.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/features/logs/data/models/traffic_log/traffic_log.dart';
import 'package:corporate_threat_detection/features/network/data/data_source/network_data_source.dart';
import 'package:corporate_threat_detection/features/network/data/models/device_api_usage_model/device_api_usage_model.dart';
import 'package:corporate_threat_detection/features/network/data/models/network_device_model/network_device_model.dart';
import 'package:corporate_threat_detection/features/network/data/models/network_protocol_model/network_protocol_model.dart';
import 'package:corporate_threat_detection/features/network/domain/repository/network_repository.dart';
import 'package:firebase_core/firebase_core.dart';

class NetworkRepositoryImpl implements NetworkRepository {
  final NetworkDataSource dataSource;

  NetworkRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<TrafficLog>>> getTrafficLogs({
    int limit = 200,
  }) async {
    try {
      final logs = await dataSource.getTrafficLogs(limit: limit);
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
  Stream<Either<Failure, List<TrafficLog>>> streamTrafficLogs({
    int limit = 200,
  }) {
    try {
      return dataSource
          .streamTrafficLogs(limit: limit)
          .map((logs) => Right<Failure, List<TrafficLog>>(logs));
    } on FirebaseException catch (e) {
      return Stream.value(Left(ServerFailure(message: e.message ?? e.code)));
    } catch (e) {
      return Stream.value(Left(UnexpectedFailure(message: e.toString())));
    }
  }

  @override
  Stream<Either<Failure, List<TrafficLog>>> streamTrafficLogsByDevice({
    required String deviceId,
    int limit = 200,
  }) {
    try {
      return dataSource
          .streamTrafficLogsByDevice(deviceId, limit: limit)
          .map((logs) => Right<Failure, List<TrafficLog>>(logs));
    } on FirebaseException catch (e) {
      return Stream.value(Left(ServerFailure(message: e.message ?? e.code)));
    } catch (e) {
      return Stream.value(Left(UnexpectedFailure(message: e.toString())));
    }
  }

  @override
  Stream<Either<Failure, List<NetworkDeviceModel>>> streamDevices({
    int limit = 200,
  }) {
    try {
      return dataSource
          .streamDevices(limit: limit)
          .map((devices) => Right<Failure, List<NetworkDeviceModel>>(devices));
    } on FirebaseException catch (e) {
      return Stream.value(Left(ServerFailure(message: e.message ?? e.code)));
    } catch (e) {
      return Stream.value(Left(UnexpectedFailure(message: e.toString())));
    }
  }

  @override
  Stream<Either<Failure, NetworkDeviceModel?>> streamDevice({
    required String deviceId,
  }) {
    try {
      return dataSource
          .streamDevice(deviceId)
          .map((device) => Right<Failure, NetworkDeviceModel?>(device));
    } on FirebaseException catch (e) {
      return Stream.value(Left(ServerFailure(message: e.message ?? e.code)));
    } catch (e) {
      return Stream.value(Left(UnexpectedFailure(message: e.toString())));
    }
  }

  @override
  Stream<Either<Failure, List<NetworkProtocolModel>>> streamProtocols({
    int limit = 200,
  }) {
    try {
      return dataSource
          .streamProtocols(limit: limit)
          .map(
            (protocols) =>
                Right<Failure, List<NetworkProtocolModel>>(protocols),
          );
    } on FirebaseException catch (e) {
      return Stream.value(Left(ServerFailure(message: e.message ?? e.code)));
    } catch (e) {
      return Stream.value(Left(UnexpectedFailure(message: e.toString())));
    }
  }

  @override
  Stream<Either<Failure, List<DeviceApiUsageModel>>> streamDeviceApiUsage({
    String? deviceId,
    int limit = 200,
  }) {
    try {
      return dataSource
          .streamDeviceApiUsage(deviceId: deviceId, limit: limit)
          .map(
            (usage) =>
                Right<Failure, List<DeviceApiUsageModel>>(usage),
          );
    } on FirebaseException catch (e) {
      return Stream.value(Left(ServerFailure(message: e.message ?? e.code)));
    } catch (e) {
      return Stream.value(Left(UnexpectedFailure(message: e.toString())));
    }
  }
}
