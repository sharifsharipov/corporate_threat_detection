import 'package:corporate_threat_detection/core/common/custom_app_bar.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/pages/dashboard_realtime_page/dashboard_realtime_body.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/pages/dashboard_realtime_page/dashboard_realtime_mixin.dart';
import 'package:flutter/material.dart';

class DashboardRealtimePage extends StatefulWidget {
  const DashboardRealtimePage({super.key});

  @override
  State<DashboardRealtimePage> createState() => _DashboardRealtimePageState();
}

class _DashboardRealtimePageState extends State<DashboardRealtimePage>
    with DashboardRealtimeMixin {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CustomAppBar(title: 'Realtime Monitoring'),
    body: DashboardRealtimeBody(mixin: this),
  );
}
