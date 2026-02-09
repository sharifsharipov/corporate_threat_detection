class MonthlyTrendModel {
  final String month;
  final int detected;
  final int blocked;
  final int falsePositives;

  const MonthlyTrendModel({
    required this.month,
    required this.detected,
    required this.blocked,
    required this.falsePositives,
  });

  factory MonthlyTrendModel.fromJson(Map<String, dynamic> json) {
    return MonthlyTrendModel(
      month: json['month'] as String? ?? '',
      detected: _toInt(json['detected']),
      blocked: _toInt(json['blocked']),
      falsePositives: _toInt(json['falsePositives']),
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'month': month,
    'detected': detected,
    'blocked': blocked,
    'falsePositives': falsePositives,
  };

  static int _toInt(dynamic value, {int fallback = 0}) {
    if (value is int) return value;
    if (value is num) return value.toInt();
    if (value is String) return int.tryParse(value) ?? fallback;
    return fallback;
  }
}
