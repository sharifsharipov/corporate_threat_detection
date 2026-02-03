import 'package:corporate_threat_detection/core/common/custom_app_bar.dart';
import 'package:corporate_threat_detection/features/analytics/presentation/pages/reports_page/reports_body.dart';
import 'package:corporate_threat_detection/features/analytics/presentation/pages/reports_page/reports_mixin.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/widgets/dashboard_drawer.dart';
import 'package:flutter/material.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({super.key});

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> with ReportsMixin {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CustomAppBar(
      title: 'Reports',
      leadingVisible: true,
      customLeading: false,
    ),
    drawer: const DashboardDrawer(),
    body: ReportsBody(mixin: this),
  );
}
