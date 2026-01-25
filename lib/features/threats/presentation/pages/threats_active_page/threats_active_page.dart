import 'package:corporate_threat_detection/core/common/custom_app_bar.dart';
import 'package:corporate_threat_detection/features/threats/presentation/pages/threats_active_page/threats_active_mixin.dart';
import 'package:flutter/material.dart';

class ThreatsActivePage extends StatefulWidget {
  const ThreatsActivePage({super.key});

  @override
  State<ThreatsActivePage> createState() => _ThreatsActivePageState();
}

class _ThreatsActivePageState extends State<ThreatsActivePage>
    with ThreatsActiveMixin {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CustomAppBar(title: 'Active Threats'),
    body: const Center(child: Text('Welcome to the Active Threats Page!')),
  );
}
