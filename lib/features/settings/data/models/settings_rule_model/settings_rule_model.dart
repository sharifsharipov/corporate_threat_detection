class SettingsRuleModel {
  final String id;
  final String title;
  final String description;
  final bool isEnabled;
  final String severity;
  final DateTime? updatedAt;

  const SettingsRuleModel({
    required this.id,
    required this.title,
    required this.description,
    required this.isEnabled,
    required this.severity,
    this.updatedAt,
  });

  factory SettingsRuleModel.fromJson(Map<String, dynamic> json, {String? id}) {
    return SettingsRuleModel(
      id: id ?? json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      isEnabled: json['isEnabled'] as bool? ?? false,
      severity: json['severity'] as String? ?? 'medium',
      updatedAt: _parseDate(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'title': title,
    'description': description,
    'isEnabled': isEnabled,
    'severity': severity,
    'updatedAt': updatedAt?.toIso8601String(),
  };

  static DateTime? _parseDate(dynamic value) {
    if (value is DateTime) return value;
    if (value is String) return DateTime.tryParse(value);
    return null;
  }
}
