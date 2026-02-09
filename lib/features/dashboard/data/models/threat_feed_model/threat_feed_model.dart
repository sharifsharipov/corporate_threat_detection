class ThreatFeedModel {
  final String id;
  final String description;
  final String type;
  final String source;
  final DateTime timestamp;

  const ThreatFeedModel({
    required this.id,
    required this.description,
    required this.type,
    required this.source,
    required this.timestamp,
  });

  factory ThreatFeedModel.fromJson(Map<String, dynamic> json, {String? id}) {
    return ThreatFeedModel(
      id: id ?? (json['id'] as String? ?? ''),
      description: json['description'] as String? ?? '',
      type: json['type'] as String? ?? 'suspicious',
      source: json['source'] as String? ?? '',
      timestamp: _parseDate(json['timestamp']) ?? DateTime.now(),
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
