import 'package:corporate_threat_detection/core/common/custom_app_bar.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/pages/dashboard_threat_summary_page/dashboard_threat_summary_mixin.dart';
import 'package:flutter/material.dart';

class DashboardThreatSummaryPage extends StatefulWidget {
  const DashboardThreatSummaryPage({super.key});

  @override
  State<DashboardThreatSummaryPage> createState() =>
      _DashboardThreatSummaryPageState();
}

class _DashboardThreatSummaryPageState extends State<DashboardThreatSummaryPage>
    with DashboardThreatSummaryMixin {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CustomAppBar(title: 'Threat Summary'),
    body: const Center(child: Text('Welcome to the Threat Summary Page!')),
  );
}
