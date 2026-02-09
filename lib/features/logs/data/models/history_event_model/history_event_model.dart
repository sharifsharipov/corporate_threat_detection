enum EventSeverity { critical, high, medium, low }

class HistoryEventModel {
  final String title;
  final String description;
  final DateTime timestamp;
  final EventSeverity severity;
  final String eventType;
  final String? ipAddress;
  final String? target;
  final String actionTaken;
  final int relatedEvents;

  const HistoryEventModel({
    required this.title,
    required this.description,
    required this.timestamp,
    required this.severity,
    required this.eventType,
    this.ipAddress,
    this.target,
    required this.actionTaken,
    required this.relatedEvents,
  });

  factory HistoryEventModel.fromJson(Map<String, dynamic> json) {
    return HistoryEventModel(
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      timestamp: _parseTimestamp(json['timestamp']),
      severity: _parseSeverity(json['severity']),
      eventType: json['eventType'] as String? ?? '',
      ipAddress: json['ipAddress'] as String?,
      target: json['target'] as String?,
      actionTaken: json['actionTaken'] as String? ?? '',
      relatedEvents: _toInt(json['relatedEvents']),
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'title': title,
    'description': description,
    'timestamp': timestamp.toIso8601String(),
    'severity': severity.name,
    'eventType': eventType,
    'ipAddress': ipAddress,
    'target': target,
    'actionTaken': actionTaken,
    'relatedEvents': relatedEvents,
  };

  static DateTime _parseTimestamp(dynamic value) {
    if (value is DateTime) return value;
    if (value is String) return DateTime.tryParse(value) ?? DateTime.now();
    return DateTime.now();
  }

  static EventSeverity _parseSeverity(dynamic value) {
    if (value is EventSeverity) return value;
    if (value is String) {
      final normalized = value.toLowerCase();
      return EventSeverity.values.firstWhere(
            (entry) => entry.name == normalized,
        orElse: () => EventSeverity.low,
      );
    }
    if (value is int && value >= 0 && value < EventSeverity.values.length) {
      return EventSeverity.values[value];
    }
    return EventSeverity.low;
  }

  static int _toInt(dynamic value, {int fallback = 0}) {
    if (value is int) return value;
    if (value is num) return value.toInt();
    if (value is String) return int.tryParse(value) ?? fallback;
    return fallback;
  }
}
