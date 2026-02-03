import 'package:corporate_threat_detection/core/common/custom_app_bar.dart';
import 'package:corporate_threat_detection/features/settings/presentation/pages/alerts_page/alerts_body.dart';
import 'package:corporate_threat_detection/features/settings/presentation/pages/alerts_page/alerts_mixin.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/widgets/dashboard_drawer.dart';
import 'package:flutter/material.dart';

class AlertsPage extends StatefulWidget {
  const AlertsPage({super.key});

  @override
  State<AlertsPage> createState() => _AlertsPageState();
}

class _AlertsPageState extends State<AlertsPage> with AlertsMixin {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CustomAppBar(
      title: 'Alerts',
      leadingVisible: true,
      customLeading: false,
    ),
    drawer: const DashboardDrawer(),
    body: AlertsBody(mixin: this),
  );
}
