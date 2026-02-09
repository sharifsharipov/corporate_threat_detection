class ReportTypeModel {
  final String title;
  final String description;
  final int iconCodePoint;
  final int colorValue;
  final int recentCount;

  const ReportTypeModel({
    required this.title,
    required this.description,
    required this.iconCodePoint,
    required this.colorValue,
    required this.recentCount,
  });

  factory ReportTypeModel.fromJson(Map<String, dynamic> json) {
    return ReportTypeModel(
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      iconCodePoint: _toInt(json['iconCodePoint']),
      colorValue: _toInt(json['colorValue'], fallback: 0xFF000000),
      recentCount: _toInt(json['recentCount']),
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'title': title,
    'description': description,
    'iconCodePoint': iconCodePoint,
    'colorValue': colorValue,
    'recentCount': recentCount,
  };

  static int _toInt(dynamic value, {int fallback = 0}) {
    if (value is int) return value;
    if (value is num) return value.toInt();
    if (value is String) return int.tryParse(value) ?? fallback;
    return fallback;
  }
}
