class ThreatMapLocationModel {
  final String id;
  final double x;
  final double y;
  final String country;
  final int threatCount;
  final int colorValue;

  const ThreatMapLocationModel({
    required this.id,
    required this.x,
    required this.y,
    required this.country,
    required this.threatCount,
    required this.colorValue,
  });

  factory ThreatMapLocationModel.fromJson(
    Map<String, dynamic> json, {
    String? id,
  }) {
    return ThreatMapLocationModel(
      id: id ?? (json['id'] as String? ?? ''),
      x: (json['x'] as num?)?.toDouble() ?? 0,
      y: (json['y'] as num?)?.toDouble() ?? 0,
      country: json['country'] as String? ?? '',
      threatCount: (json['threatCount'] as num?)?.toInt() ?? 0,
      colorValue: (json['colorValue'] as num?)?.toInt() ?? 0xFF03A64B,
    );
  }
}
