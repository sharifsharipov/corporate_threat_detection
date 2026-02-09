import 'dart:async';

import 'package:corporate_threat_detection/features/settings/data/models/settings_rule_model/settings_rule_model.dart';
import 'package:corporate_threat_detection/features/settings/domain/use_cases/stream_settings_rules_use_case.dart';
import 'package:corporate_threat_detection/features/settings/domain/use_cases/update_settings_rule_use_case.dart';
import 'package:corporate_threat_detection/features/settings/presentation/bloc/settings_rules_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsRulesCubit extends Cubit<SettingsRulesState> {
  final StreamSettingsRulesUseCase streamSettingsRulesUseCase;
  final UpdateSettingsRuleUseCase updateSettingsRuleUseCase;
  StreamSubscription? _subscription;

  SettingsRulesCubit({
    required this.streamSettingsRulesUseCase,
    required this.updateSettingsRuleUseCase,
  }) : super(SettingsRulesState.initial());

  void startRealtime({int limit = 200}) {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    _subscription?.cancel();
    _subscription = streamSettingsRulesUseCase(limit: limit).listen(
      (result) {
        result.either(
          (failure) => emit(
            state.copyWith(isLoading: false, errorMessage: failure.message),
          ),
          (rules) => emit(
            state.copyWith(
              isLoading: false,
              rules: rules.isNotEmpty ? rules : _mockRules,
              errorMessage: null,
            ),
          ),
        );
      },
      onError: (Object error) {
        emit(state.copyWith(isLoading: false, errorMessage: error.toString()));
      },
    );
  }

  Future<void> updateRule(String id, bool enabled) async {
    // Optimistic update
    final updated = state.rules.map((r) {
      if (r.id == id) {
        return SettingsRuleModel(
          id: r.id,
          title: r.title,
          description: r.description,
          isEnabled: enabled,
          severity: r.severity,
          updatedAt: DateTime.now(),
        );
      }
      return r;
    }).toList();
    emit(state.copyWith(rules: updated));

    final result = await updateSettingsRuleUseCase(id, enabled);
    result.either(
      (failure) => emit(state.copyWith(errorMessage: failure.message)),
      (_) => null,
    );
  }

  static final List<SettingsRuleModel> _mockRules = [
    SettingsRuleModel(
      id: 'R-1',
      title: 'Enable AI Threat Detection',
      description:
          'Use advanced machine learning to identify anomalous behavior patterns.',
      isEnabled: true,
      severity: 'high',
      updatedAt: DateTime.now(),
    ),
    SettingsRuleModel(
      id: 'R-2',
      title: 'Real-time Traffic Scanning',
      description:
          'Continuously scan all inbound and outbound network traffic.',
      isEnabled: true,
      severity: 'medium',
      updatedAt: DateTime.now(),
    ),
    SettingsRuleModel(
      id: 'R-3',
      title: 'Automatic IP Blocking',
      description:
          'Automatically block IPs that reach a certain threat threshold.',
      isEnabled: false,
      severity: 'critical',
      updatedAt: DateTime.now(),
    ),
  ];

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
