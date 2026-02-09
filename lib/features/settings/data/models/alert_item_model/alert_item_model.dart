enum AlertSeverity { critical, high, medium, low }

enum AlertStatus { active, acknowledged, resolved }

class AlertItemModel {
  final String id;
  final String title;
  final String description;
  final AlertSeverity severity;
  final AlertStatus status;
  final DateTime timestamp;

  const AlertItemModel({
    required this.id,
    required this.title,
    required this.description,
    required this.severity,
    required this.status,
    required this.timestamp,
  });

  factory AlertItemModel.fromJson(Map<String, dynamic> json, {String? id}) {
    return AlertItemModel(
      id: id ?? json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      severity: _parseSeverity(json['severity']),
      status: _parseStatus(json['status']),
      timestamp: _parseTimestamp(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'title': title,
    'description': description,
    'severity': severity.name,
    'status': status.name,
    'timestamp': timestamp.toIso8601String(),
  };

  static AlertSeverity _parseSeverity(dynamic value) {
    if (value is AlertSeverity) return value;
    if (value is String) {
      final normalized = value.toLowerCase();
      return AlertSeverity.values.firstWhere(
        (entry) => entry.name == normalized,
        orElse: () => AlertSeverity.low,
      );
    }
    if (value is int && value >= 0 && value < AlertSeverity.values.length) {
      return AlertSeverity.values[value];
    }
    return AlertSeverity.low;
  }

  static AlertStatus _parseStatus(dynamic value) {
    if (value is AlertStatus) return value;
    if (value is String) {
      final normalized = value.toLowerCase();
      return AlertStatus.values.firstWhere(
        (entry) => entry.name == normalized,
        orElse: () => AlertStatus.active,
      );
    }
    if (value is int && value >= 0 && value < AlertStatus.values.length) {
      return AlertStatus.values[value];
    }
    return AlertStatus.active;
  }

  static DateTime _parseTimestamp(dynamic value) {
    if (value is DateTime) return value;
    if (value is String) return DateTime.tryParse(value) ?? DateTime.now();
    return DateTime.now();
  }
}
