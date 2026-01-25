import 'package:corporate_threat_detection/core/common/custom_app_bar.dart';
import 'package:corporate_threat_detection/features/threats/presentation/pages/threats_resolved_page/threats_resolved_mixin.dart';
import 'package:flutter/material.dart';

class ThreatsResolvedPage extends StatefulWidget {
  const ThreatsResolvedPage({super.key});

  @override
  State<ThreatsResolvedPage> createState() => _ThreatsResolvedPageState();
}

class _ThreatsResolvedPageState extends State<ThreatsResolvedPage>
    with ThreatsResolvedMixin {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CustomAppBar(title: 'Resolved Threats'),
    body: const Center(child: Text('Welcome to the Resolved Threats Page!')),
  );
}
