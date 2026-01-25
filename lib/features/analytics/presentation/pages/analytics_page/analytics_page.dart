import 'package:corporate_threat_detection/core/common/custom_app_bar.dart';
import 'package:corporate_threat_detection/features/analytics/presentation/pages/analytics_page/analytics_mixin.dart';
import 'package:flutter/material.dart';

class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({super.key});

  @override
  State<AnalyticsPage> createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> with AnalyticsMixin {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: CustomAppBar(title: 'Analytics'),
    body: const Center(child: Text('Welcome to the Analytics Page!')),
  );
}
