import 'package:corporate_threat_detection/core/common/custom_app_bar.dart';
import 'package:corporate_threat_detection/features/logs/presentation/pages/logs_page/logs_body.dart';
import 'package:corporate_threat_detection/features/logs/presentation/pages/logs_page/logs_mixin.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/widgets/dashboard_drawer.dart';
import 'package:flutter/material.dart';

class LogsPage extends StatefulWidget {
  const LogsPage({super.key});

  @override
  State<LogsPage> createState() => _LogsPageState();
}

class _LogsPageState extends State<LogsPage> with LogsMixin {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CustomAppBar(
      title: 'Logs',
      leadingVisible: true,
      customLeading: false,
    ),
    drawer: const DashboardDrawer(),
    body: LogsBody(mixin: this),
  );
}
