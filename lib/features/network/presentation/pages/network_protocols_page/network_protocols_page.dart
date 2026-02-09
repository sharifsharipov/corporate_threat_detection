import 'package:corporate_threat_detection/core/common/custom_app_bar.dart';
import 'package:corporate_threat_detection/features/network/presentation/bloc/network_protocols_cubit.dart';
import 'package:corporate_threat_detection/features/network/presentation/bloc/network_protocols_state.dart';
import 'package:corporate_threat_detection/features/network/presentation/pages/network_protocols_page/network_protocols_body.dart';
import 'package:corporate_threat_detection/injector_container_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NetworkProtocolsPage extends StatefulWidget {
  const NetworkProtocolsPage({super.key});

  @override
  State<NetworkProtocolsPage> createState() => _NetworkProtocolsPageState();
}

class _NetworkProtocolsPageState extends State<NetworkProtocolsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<NetworkProtocolsCubit>(
      create: (_) => sl<NetworkProtocolsCubit>()..startRealtime(),
      child: BlocListener<NetworkProtocolsCubit, NetworkProtocolsState>(
        listenWhen: (prev, next) =>
            prev.errorMessage != next.errorMessage &&
            next.errorMessage != null,
        listener: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage!)),
          );
        },
        child: const Scaffold(
          appBar: CustomAppBar(title: 'Network Protocols'),
          body: NetworkProtocolsBody(),
        ),
      ),
    );
  }
}
