import 'package:corporate_threat_detection/features/methods/data/models/detection_method/detection_method.dart';
import 'package:equatable/equatable.dart';

class MethodsState extends Equatable {
  final bool isLoading;
  final List<DetectionMethod> methods;
  final String? errorMessage;
  final String? activeType;

  const MethodsState({
    required this.isLoading,
    required this.methods,
    required this.errorMessage,
    required this.activeType,
  });

  factory MethodsState.initial() => const MethodsState(
        isLoading: false,
        methods: [],
        errorMessage: null,
        activeType: null,
      );

  MethodsState copyWith({
    bool? isLoading,
    List<DetectionMethod>? methods,
    String? errorMessage,
    String? activeType,
  }) {
    return MethodsState(
      isLoading: isLoading ?? this.isLoading,
      methods: methods ?? this.methods,
      errorMessage: errorMessage,
      activeType: activeType ?? this.activeType,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        isLoading,
        methods,
        errorMessage,
        activeType,
      ];
}
