import 'package:corporate_threat_detection/core/common/custom_app_bar.dart';
import 'package:corporate_threat_detection/features/settings/presentation/bloc/settings_rules_cubit.dart';
import 'package:corporate_threat_detection/features/settings/presentation/bloc/settings_rules_state.dart';
import 'package:corporate_threat_detection/features/settings/presentation/pages/settings_rules_page/settings_rules_body.dart';
import 'package:corporate_threat_detection/injector_container_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsRulesPage extends StatefulWidget {
  const SettingsRulesPage({super.key});

  @override
  State<SettingsRulesPage> createState() => _SettingsRulesPageState();
}

class _SettingsRulesPageState extends State<SettingsRulesPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SettingsRulesCubit>(
      create: (_) => sl<SettingsRulesCubit>()..startRealtime(),
      child: BlocListener<SettingsRulesCubit, SettingsRulesState>(
        listenWhen: (prev, next) =>
            prev.errorMessage != next.errorMessage &&
            next.errorMessage != null,
        listener: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage!)),
          );
        },
        child: const Scaffold(
          appBar: CustomAppBar(title: 'Settings Rules'),
          body: SettingsRulesBody(),
        ),
      ),
    );
  }
}
