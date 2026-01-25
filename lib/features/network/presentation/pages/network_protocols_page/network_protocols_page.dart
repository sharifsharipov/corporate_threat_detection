import 'package:corporate_threat_detection/core/common/custom_app_bar.dart';
import 'package:corporate_threat_detection/features/network/presentation/pages/network_protocols_page/network_protocols_mixin.dart';
import 'package:flutter/material.dart';

class NetworkProtocolsPage extends StatefulWidget {
  const NetworkProtocolsPage({super.key});

  @override
  State<NetworkProtocolsPage> createState() => _NetworkProtocolsPageState();
}

class _NetworkProtocolsPageState extends State<NetworkProtocolsPage>
    with NetworkProtocolsMixin {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CustomAppBar(title: 'Network Protocols'),
    body: const Center(child: Text('Welcome to the Network Protocols Page!')),
  );
}
