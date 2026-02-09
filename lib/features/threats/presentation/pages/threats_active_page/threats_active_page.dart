import 'package:corporate_threat_detection/core/common/custom_app_bar.dart';
import 'package:corporate_threat_detection/features/threats/presentation/bloc/threats_cubit.dart';
import 'package:corporate_threat_detection/features/threats/presentation/bloc/threats_state.dart';
import 'package:corporate_threat_detection/features/threats/presentation/widgets/threats_list_body.dart';
import 'package:corporate_threat_detection/injector_container_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThreatsActivePage extends StatefulWidget {
  const ThreatsActivePage({super.key});

  @override
  State<ThreatsActivePage> createState() => _ThreatsActivePageState();
}

class _ThreatsActivePageState extends State<ThreatsActivePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThreatsCubit>(
      create: (_) => sl<ThreatsCubit>()..startRealtimeByStatus('active'),
      child: BlocListener<ThreatsCubit, ThreatsState>(
        listenWhen: (prev, next) =>
            prev.errorMessage != next.errorMessage &&
            next.errorMessage != null,
        listener: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage!)),
          );
        },
        child: const Scaffold(
          appBar: CustomAppBar(title: 'Active Threats'),
          body: ThreatsListBody(showResolved: false),
        ),
      ),
    );
  }
}
