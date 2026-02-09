import 'package:corporate_threat_detection/features/settings/data/models/settings_rule_model/settings_rule_model.dart';
import 'package:equatable/equatable.dart';

class SettingsRulesState extends Equatable {
  final bool isLoading;
  final List<SettingsRuleModel> rules;
  final String? errorMessage;

  const SettingsRulesState({
    required this.isLoading,
    required this.rules,
    required this.errorMessage,
  });

  factory SettingsRulesState.initial() => const SettingsRulesState(
    isLoading: false,
    rules: [],
    errorMessage: null,
  );

  SettingsRulesState copyWith({
    bool? isLoading,
    List<SettingsRuleModel>? rules,
    String? errorMessage,
  }) {
    return SettingsRulesState(
      isLoading: isLoading ?? this.isLoading,
      rules: rules ?? this.rules,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => <Object?>[isLoading, rules, errorMessage];
}
