class NetworkProtocolModel {
  final String id;
  final String name;
  final int port;
  final String description;
  final int usageCount;
  final String status;
  final DateTime? lastSeen;

  const NetworkProtocolModel({
    required this.id,
    required this.name,
    required this.port,
    required this.description,
    required this.usageCount,
    required this.status,
    required this.lastSeen,
  });

  factory NetworkProtocolModel.fromJson(
    Map<String, dynamic> json, {
    String? id,
  }) {
    return NetworkProtocolModel(
      id: id ?? (json['id'] as String? ?? ''),
      name: json['name'] as String? ?? '',
      port: (json['port'] as num?)?.toInt() ?? 0,
      description: json['description'] as String? ?? '',
      usageCount: (json['usageCount'] as num?)?.toInt() ?? 0,
      status: json['status'] as String? ?? 'monitored',
      lastSeen: _parseDate(json['lastSeen']),
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
