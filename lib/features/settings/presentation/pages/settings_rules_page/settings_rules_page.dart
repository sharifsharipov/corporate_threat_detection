import 'package:corporate_threat_detection/core/common/custom_app_bar.dart';
import 'package:corporate_threat_detection/features/settings/presentation/pages/settings_rules_page/settings_rules_mixin.dart';
import 'package:flutter/material.dart';

class SettingsRulesPage extends StatefulWidget {
  const SettingsRulesPage({super.key});

  @override
  State<SettingsRulesPage> createState() => _SettingsRulesPageState();
}

class _SettingsRulesPageState extends State<SettingsRulesPage>
    with SettingsRulesMixin {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CustomAppBar(title: 'Settings Rules'),
    body: const Center(child: Text('Welcome to the Settings Rules Page!')),
  );
}
