import 'package:corporate_threat_detection/core/common/custom_app_bar.dart';
import 'package:corporate_threat_detection/features/network/presentation/pages/device_api_usage_page/device_api_usage_mixin.dart';
import 'package:flutter/material.dart';

class DeviceApiUsagePage extends StatefulWidget {
  const DeviceApiUsagePage({super.key});

  @override
  State<DeviceApiUsagePage> createState() => _DeviceApiUsagePageState();
}

class _DeviceApiUsagePageState extends State<DeviceApiUsagePage>
    with DeviceApiUsageMixin {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CustomAppBar(title: 'Device API Usage'),
    body: const Center(child: Text('Welcome to the Device API Usage Page!')),
  );
}
