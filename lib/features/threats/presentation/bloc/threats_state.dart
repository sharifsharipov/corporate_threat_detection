import 'package:corporate_threat_detection/features/threats/data/models/threat/threat.dart';
import 'package:equatable/equatable.dart';

class ThreatsState extends Equatable {
  final bool isLoading;
  final bool isUpdating;
  final List<Threat> threats;
  final Threat? selectedThreat;
  final String? errorMessage;

  const ThreatsState({
    required this.isLoading,
    required this.isUpdating,
    required this.threats,
    required this.selectedThreat,
    required this.errorMessage,
  });

  factory ThreatsState.initial() => const ThreatsState(
    isLoading: false,
    isUpdating: false,
    threats: [],
    selectedThreat: null,
    errorMessage: null,
  );

  ThreatsState copyWith({
    bool? isLoading,
    bool? isUpdating,
    List<Threat>? threats,
    Threat? selectedThreat,
    String? errorMessage,
  }) {
    return ThreatsState(
      isLoading: isLoading ?? this.isLoading,
      isUpdating: isUpdating ?? this.isUpdating,
      threats: threats ?? this.threats,
      selectedThreat: selectedThreat ?? this.selectedThreat,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => <Object?>[
    isLoading,
    isUpdating,
    threats,
    selectedThreat,
    errorMessage,
  ];
}
