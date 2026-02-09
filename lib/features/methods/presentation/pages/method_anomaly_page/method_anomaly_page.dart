import 'package:corporate_threat_detection/core/common/custom_app_bar.dart';
import 'package:corporate_threat_detection/features/methods/presentation/bloc/methods_cubit.dart';
import 'package:corporate_threat_detection/features/methods/presentation/bloc/methods_state.dart';
import 'package:corporate_threat_detection/features/methods/presentation/widgets/methods_list_body.dart';
import 'package:corporate_threat_detection/injector_container_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MethodAnomalyPage extends StatefulWidget {
  const MethodAnomalyPage({super.key});

  @override
  State<MethodAnomalyPage> createState() => _MethodAnomalyPageState();
}

class _MethodAnomalyPageState extends State<MethodAnomalyPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MethodsCubit>(
      create: (_) =>
          sl<MethodsCubit>()..startRealtime(type: 'anomaly'),
      child: BlocListener<MethodsCubit, MethodsState>(
        listenWhen: (prev, next) =>
            prev.errorMessage != next.errorMessage &&
            next.errorMessage != null,
        listener: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage!)),
          );
        },
        child: const Scaffold(
          appBar: CustomAppBar(title: 'Anomaly Detection'),
          body: MethodsListBody(),
        ),
      ),
    );
  }
}
