class DeviceApiUsageModel {
  final String id;
  final String deviceId;
  final String endpoint;
  final String method;
  final int requestCount;
  final double successRate;
  final DateTime? lastCalled;
  final String status;

  const DeviceApiUsageModel({
    required this.id,
    required this.deviceId,
    required this.endpoint,
    required this.method,
    required this.requestCount,
    required this.successRate,
    required this.lastCalled,
    required this.status,
  });

  factory DeviceApiUsageModel.fromJson(
    Map<String, dynamic> json, {
    String? id,
  }) {
    return DeviceApiUsageModel(
      id: id ?? (json['id'] as String? ?? ''),
      deviceId: json['deviceId'] as String? ?? '',
      endpoint: json['endpoint'] as String? ?? '',
      method: json['method'] as String? ?? 'GET',
      requestCount: (json['requestCount'] as num?)?.toInt() ?? 0,
      successRate: (json['successRate'] as num?)?.toDouble() ?? 0,
      lastCalled: _parseDate(json['lastCalled']),
      status: json['status'] as String? ?? 'healthy',
    );
  }

  static DateTime? _parseDate(dynamic value) {
    if (value is DateTime) {
      return value;
    }
    if (value is String) {
      return DateTime.tryParse(value);
    }
    return null;
  }
}
