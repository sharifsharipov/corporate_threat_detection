import 'package:corporate_threat_detection/core/common/custom_app_bar.dart';
import 'package:corporate_threat_detection/features/network/presentation/pages/network_devices_page/network_devices_mixin.dart';
import 'package:flutter/material.dart';

class NetworkDevicesPage extends StatefulWidget {
  const NetworkDevicesPage({super.key});

  @override
  State<NetworkDevicesPage> createState() => _NetworkDevicesPageState();
}

class _NetworkDevicesPageState extends State<NetworkDevicesPage>
    with NetworkDevicesMixin {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CustomAppBar(title: 'Network Devices'),
    body: const Center(child: Text('Welcome to the Network Devices Page!')),
  );
}
