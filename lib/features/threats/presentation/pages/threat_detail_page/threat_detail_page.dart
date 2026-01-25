import 'package:corporate_threat_detection/core/common/custom_app_bar.dart';
import 'package:corporate_threat_detection/features/threats/presentation/pages/threat_detail_page/threat_detail_mixin.dart';
import 'package:flutter/material.dart';

class ThreatDetailPage extends StatefulWidget {
  const ThreatDetailPage({super.key});

  @override
  State<ThreatDetailPage> createState() => _ThreatDetailPageState();
}

class _ThreatDetailPageState extends State<ThreatDetailPage>
    with ThreatDetailMixin {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CustomAppBar(title: 'Threat Details'),
    body: const Center(child: Text('Welcome to the Threat Details Page!')),
  );
}
