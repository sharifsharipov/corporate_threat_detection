import 'package:equatable/equatable.dart';

class ThreatTypeSummary extends Equatable {
  final String type;
  final int total;
  final int critical;
  final int high;
  final int medium;
  final int low;

  const ThreatTypeSummary({
    required this.type,
    required this.total,
    required this.critical,
    required this.high,
    required this.medium,
    required this.low,
  });

  @override
  List<Object?> get props => <Object?>[type, total, critical, high, medium, low];
}

class ThreatTypesState extends Equatable {
  final bool isLoading;
  final List<ThreatTypeSummary> summaries;
  final String? errorMessage;

  const ThreatTypesState({
    required this.isLoading,
    required this.summaries,
    required this.errorMessage,
  });

  factory ThreatTypesState.initial() => const ThreatTypesState(
        isLoading: false,
        summaries: [],
        errorMessage: null,
      );

  ThreatTypesState copyWith({
    bool? isLoading,
    List<ThreatTypeSummary>? summaries,
    String? errorMessage,
  }) {
    return ThreatTypesState(
      isLoading: isLoading ?? this.isLoading,
      summaries: summaries ?? this.summaries,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => <Object?>[isLoading, summaries, errorMessage];
}
