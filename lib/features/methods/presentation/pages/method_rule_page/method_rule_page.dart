import 'package:corporate_threat_detection/core/common/custom_app_bar.dart';
import 'package:corporate_threat_detection/features/methods/presentation/pages/method_rule_page/method_rule_mixin.dart';
import 'package:flutter/material.dart';

class MethodRulePage extends StatefulWidget {
  const MethodRulePage({super.key});

  @override
  State<MethodRulePage> createState() => _MethodRulePageState();
}

class _MethodRulePageState extends State<MethodRulePage> with MethodRuleMixin {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CustomAppBar(title: 'Rule-Based Detection'),
    body: const Center(
      child: Text('Welcome to the Rule-Based Detection Page!'),
    ),
  );
}
