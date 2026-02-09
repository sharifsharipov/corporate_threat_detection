import 'package:corporate_threat_detection/core/common/custom_app_bar.dart';
import 'package:corporate_threat_detection/features/network/presentation/bloc/device_api_usage_cubit.dart';
import 'package:corporate_threat_detection/features/network/presentation/bloc/device_api_usage_state.dart';
import 'package:corporate_threat_detection/features/network/presentation/pages/device_api_usage_page/device_api_usage_body.dart';
import 'package:corporate_threat_detection/injector_container_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeviceApiUsagePage extends StatefulWidget {
  final String? deviceId;

  const DeviceApiUsagePage({super.key, this.deviceId});

  @override
  State<DeviceApiUsagePage> createState() => _DeviceApiUsagePageState();
}

class _DeviceApiUsagePageState extends State<DeviceApiUsagePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DeviceApiUsageCubit>(
      create: (_) =>
          sl<DeviceApiUsageCubit>()..startRealtime(deviceId: widget.deviceId),
      child: BlocListener<DeviceApiUsageCubit, DeviceApiUsageState>(
        listenWhen: (prev, next) =>
            prev.errorMessage != next.errorMessage &&
            next.errorMessage != null,
        listener: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage!)),
          );
        },
        child: const Scaffold(
          appBar: CustomAppBar(title: 'Device API Usage'),
          body: DeviceApiUsageBody(),
        ),
      ),
    );
  }
}
