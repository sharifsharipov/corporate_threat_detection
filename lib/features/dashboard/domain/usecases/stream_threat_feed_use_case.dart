import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/features/dashboard/data/models/threat_feed_model/threat_feed_model.dart';
import 'package:corporate_threat_detection/features/dashboard/domain/repository/dashboard_repository.dart';

class StreamThreatFeedUseCase {
  final DashboardRepository repository;

  StreamThreatFeedUseCase({required this.repository});

  Stream<Either<Failure, List<ThreatFeedModel>>> call({int limit = 20}) {
    return repository.streamThreatFeed(limit: limit);
  }
}
