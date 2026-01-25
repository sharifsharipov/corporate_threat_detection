import 'package:corporate_threat_detection/core/common/custom_app_bar.dart';
import 'package:corporate_threat_detection/features/network/presentation/pages/device_detail_page/device_detail_mixin.dart';
import 'package:flutter/material.dart';

class DeviceDetailPage extends StatefulWidget {
  const DeviceDetailPage({super.key});

  @override
  State<DeviceDetailPage> createState() => _DeviceDetailPageState();
}

class _DeviceDetailPageState extends State<DeviceDetailPage>
    with DeviceDetailMixin {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CustomAppBar(title: 'Device Details'),
    body: const Center(child: Text('Welcome to the Device Details Page!')),
  );
}
