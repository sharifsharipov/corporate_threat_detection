class ResponseTimeModel {
  final double averageMs;
  final double minMs;
  final double maxMs;

  const ResponseTimeModel({
    required this.averageMs,
    required this.minMs,
    required this.maxMs,
  });

  factory ResponseTimeModel.fromJson(Map<String, dynamic> json) {
    return ResponseTimeModel(
      averageMs: _toDouble(json['averageMs']),
      minMs: _toDouble(json['minMs']),
      maxMs: _toDouble(json['maxMs']),
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'averageMs': averageMs,
    'minMs': minMs,
    'maxMs': maxMs,
  };

  static double _toDouble(dynamic value, {double fallback = 0}) {
    if (value is double) return value;
    if (value is num) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? fallback;
    return fallback;
  }
}
