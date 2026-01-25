import 'package:corporate_threat_detection/core/common/custom_app_bar.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/pages/dashboard_overview_page/dashboard_overview_mixin.dart';
import 'package:flutter/material.dart';

class DashboardOverviewPage extends StatefulWidget {
  const DashboardOverviewPage({super.key});

  @override
  State<DashboardOverviewPage> createState() => _DashboardOverviewPageState();
}

class _DashboardOverviewPageState extends State<DashboardOverviewPage>
    with DashboardOverviewMixin {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CustomAppBar(title: 'Dashboard Overview'),
    body: const Center(child: Text('Welcome to the Dashboard Overview Page!')),
  );
}
