import 'package:corporate_threat_detection/core/common/custom_app_bar.dart';
import 'package:corporate_threat_detection/features/methods/presentation/pages/method_anomaly_page/method_anomaly_mixin.dart';
import 'package:flutter/material.dart';

class MethodAnomalyPage extends StatefulWidget {
  const MethodAnomalyPage({super.key});

  @override
  State<MethodAnomalyPage> createState() => _MethodAnomalyPageState();
}

class _MethodAnomalyPageState extends State<MethodAnomalyPage>
    with MethodAnomalyMixin {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CustomAppBar(title: 'Anomaly Detection'),
    body: const Center(child: Text('Welcome to the Anomaly Detection Page!')),
  );
}
