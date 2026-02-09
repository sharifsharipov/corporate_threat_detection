import 'package:corporate_threat_detection/core/common/custom_app_bar.dart';
import 'package:corporate_threat_detection/features/network/presentation/bloc/network_traffic_logs_cubit.dart';
import 'package:corporate_threat_detection/features/network/presentation/bloc/network_traffic_logs_state.dart';
import 'package:corporate_threat_detection/features/network/presentation/pages/network_traffic_logs_page/network_traffic_logs_body.dart';
import 'package:corporate_threat_detection/injector_container_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NetworkTrafficLogsPage extends StatefulWidget {
  const NetworkTrafficLogsPage({super.key});

  @override
  State<NetworkTrafficLogsPage> createState() => _NetworkTrafficLogsPageState();
}

class _NetworkTrafficLogsPageState extends State<NetworkTrafficLogsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<NetworkTrafficLogsCubit>(
      create: (_) => sl<NetworkTrafficLogsCubit>()..startRealtime(),
      child: BlocListener<NetworkTrafficLogsCubit, NetworkTrafficLogsState>(
        listenWhen: (prev, next) =>
            prev.errorMessage != next.errorMessage &&
            next.errorMessage != null,
        listener: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage!)),
          );
        },
        child: const Scaffold(
          appBar: CustomAppBar(title: 'Network Traffic Logs'),
          body: NetworkTrafficLogsBody(),
        ),
      ),
    );
  }
}
