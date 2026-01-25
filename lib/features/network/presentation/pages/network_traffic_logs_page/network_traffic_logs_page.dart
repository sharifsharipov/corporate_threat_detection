import 'package:corporate_threat_detection/core/common/custom_app_bar.dart';
import 'package:corporate_threat_detection/features/network/presentation/pages/network_traffic_logs_page/network_traffic_logs_mixin.dart';
import 'package:flutter/material.dart';

class NetworkTrafficLogsPage extends StatefulWidget {
  const NetworkTrafficLogsPage({super.key});

  @override
  State<NetworkTrafficLogsPage> createState() => _NetworkTrafficLogsPageState();
}

class _NetworkTrafficLogsPageState extends State<NetworkTrafficLogsPage>
    with NetworkTrafficLogsMixin {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CustomAppBar(title: 'Network Traffic Logs'),
    body: const Center(
      child: Text('Welcome to the Network Traffic Logs Page!'),
    ),
  );
}
