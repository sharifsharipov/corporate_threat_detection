class AttackVectorModel {
  final String name;
  final int count;
  final int colorValue;

  const AttackVectorModel({
    required this.name,
    required this.count,
    required this.colorValue,
  });

  factory AttackVectorModel.fromJson(Map<String, dynamic> json) {
    return AttackVectorModel(
      name: json['name'] as String? ?? '',
      count: _toInt(json['count']),
      colorValue: _toInt(json['colorValue'], fallback: 0xFF000000),
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'name': name,
    'count': count,
    'colorValue': colorValue,
  };

  static int _toInt(dynamic value, {int fallback = 0}) {
    if (value is int) return value;
    if (value is num) return value.toInt();
    if (value is String) return int.tryParse(value) ?? fallback;
    return fallback;
  }
}
