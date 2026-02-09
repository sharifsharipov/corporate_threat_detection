import 'package:corporate_threat_detection/core/common/custom_app_bar.dart';
import 'package:corporate_threat_detection/features/network/presentation/bloc/network_devices_cubit.dart';
import 'package:corporate_threat_detection/features/network/presentation/bloc/network_devices_state.dart';
import 'package:corporate_threat_detection/features/network/presentation/pages/network_devices_page/network_devices_body.dart';
import 'package:corporate_threat_detection/injector_container_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NetworkDevicesPage extends StatefulWidget {
  const NetworkDevicesPage({super.key});

  @override
  State<NetworkDevicesPage> createState() => _NetworkDevicesPageState();
}

class _NetworkDevicesPageState extends State<NetworkDevicesPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<NetworkDevicesCubit>(
      create: (_) => sl<NetworkDevicesCubit>()..startRealtime(),
      child: BlocListener<NetworkDevicesCubit, NetworkDevicesState>(
        listenWhen: (prev, next) =>
            prev.errorMessage != next.errorMessage &&
            next.errorMessage != null,
        listener: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage!)),
          );
        },
        child: const Scaffold(
          appBar: CustomAppBar(title: 'Network Devices'),
          body: NetworkDevicesBody(),
        ),
      ),
    );
  }
}
