import 'package:corporate_threat_detection/core/common/custom_app_bar.dart';
import 'package:corporate_threat_detection/features/network/data/models/network_device_model/network_device_model.dart';
import 'package:corporate_threat_detection/features/network/presentation/bloc/device_detail_cubit.dart';
import 'package:corporate_threat_detection/features/network/presentation/bloc/device_detail_state.dart';
import 'package:corporate_threat_detection/features/network/presentation/pages/device_detail_page/device_detail_body.dart';
import 'package:corporate_threat_detection/injector_container_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeviceDetailPage extends StatefulWidget {
  final NetworkDeviceModel? device;
  final String? deviceId;

  const DeviceDetailPage({super.key, this.device, this.deviceId});

  @override
  State<DeviceDetailPage> createState() => _DeviceDetailPageState();
}

class _DeviceDetailPageState extends State<DeviceDetailPage> {
  @override
  Widget build(BuildContext context) {
    final resolvedId = widget.deviceId ?? widget.device?.id;
    return BlocProvider<DeviceDetailCubit>(
      create: (_) {
        final cubit = sl<DeviceDetailCubit>();
        if (resolvedId != null && resolvedId.isNotEmpty) {
          cubit.startRealtime(deviceId: resolvedId);
        }
        return cubit;
      },
      child: BlocListener<DeviceDetailCubit, DeviceDetailState>(
        listenWhen: (prev, next) =>
            prev.errorMessage != next.errorMessage &&
            next.errorMessage != null,
        listener: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage!)),
          );
        },
        child: const Scaffold(
          appBar: CustomAppBar(title: 'Device Details'),
          body: DeviceDetailBody(),
        ),
      ),
    );
  }
}
