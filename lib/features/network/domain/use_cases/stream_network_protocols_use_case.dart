import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/features/network/data/models/network_protocol_model/network_protocol_model.dart';
import 'package:corporate_threat_detection/features/network/domain/repository/network_repository.dart';

class StreamNetworkProtocolsUseCase {
  final NetworkRepository repository;

  StreamNetworkProtocolsUseCase({required this.repository});

  Stream<Either<Failure, List<NetworkProtocolModel>>> call({
    int limit = 200,
  }) {
    return repository.streamProtocols(limit: limit);
  }
}
