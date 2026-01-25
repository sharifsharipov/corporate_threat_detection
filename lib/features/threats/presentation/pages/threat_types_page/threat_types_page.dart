import 'package:corporate_threat_detection/core/common/custom_app_bar.dart';
import 'package:corporate_threat_detection/features/threats/presentation/pages/threat_types_page/threat_types_mixin.dart';
import 'package:flutter/material.dart';

class ThreatTypesPage extends StatefulWidget {
  const ThreatTypesPage({super.key});

  @override
  State<ThreatTypesPage> createState() => _ThreatTypesPageState();
}

class _ThreatTypesPageState extends State<ThreatTypesPage>
    with ThreatTypesMixin {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CustomAppBar(title: 'Threat Types'),
    body: const Center(child: Text('Welcome to the Threat Types Page!')),
  );
}
