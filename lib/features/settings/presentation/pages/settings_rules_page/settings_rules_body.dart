import 'package:corporate_threat_detection/features/settings/presentation/bloc/settings_rules_cubit.dart';
import 'package:corporate_threat_detection/features/settings/presentation/bloc/settings_rules_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsRulesBody extends StatelessWidget {
  const SettingsRulesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsRulesCubit, SettingsRulesState>(
      builder: (context, state) {
        if (state.isLoading && state.rules.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.errorMessage != null && state.rules.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    state.errorMessage!,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed:
                        context.read<SettingsRulesCubit>().startRealtime,
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          );
        }

        if (state.rules.isEmpty) {
          return Center(
            child: Text(
              'No rules found',
              style: TextStyle(color: Colors.grey.shade600),
            ),
          );
        }

        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: state.rules.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final rule = state.rules[index];
            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          rule.title,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          rule.description,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Severity: ${rule.severity}',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Switch(
                    value: rule.isEnabled,
                    onChanged: (value) => context
                        .read<SettingsRulesCubit>()
                        .updateRule(rule.id, value),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
