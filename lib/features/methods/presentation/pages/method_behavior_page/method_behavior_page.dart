import 'package:corporate_threat_detection/core/common/custom_app_bar.dart';
import 'package:corporate_threat_detection/features/methods/presentation/pages/method_behavior_page/method_behavior_mixin.dart';
import 'package:flutter/material.dart';

class MethodBehaviorPage extends StatefulWidget {
  const MethodBehaviorPage({super.key});

  @override
  State<MethodBehaviorPage> createState() => _MethodBehaviorPageState();
}

class _MethodBehaviorPageState extends State<MethodBehaviorPage>
    with MethodBehaviorMixin {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CustomAppBar(title: 'Behavior Analysis'),
    body: const Center(child: Text('Welcome to the Behavior Analysis Page!')),
  );
}
