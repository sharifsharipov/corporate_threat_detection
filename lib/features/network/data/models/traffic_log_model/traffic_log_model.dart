import 'package:freezed_annotation/freezed_annotation.dart';

part 'traffic_log_model.freezed.dart';
part 'traffic_log_model.g.dart';

@freezed
class TrafficLogModel with _$TrafficLogModel {
  const factory TrafficLogModel({
    required String id,
    required DateTime timestamp,
    required String sourceIp,
    required String destinationIp,
    required int port,
    required String protocol,
    required int bytesTransferred,
    required String status, // "allowed", "blocked"
  }) = _TrafficLogModel;

  factory TrafficLogModel.fromJson(Map<String, dynamic> json) =>
      _$TrafficLogModelFromJson(json);
}
