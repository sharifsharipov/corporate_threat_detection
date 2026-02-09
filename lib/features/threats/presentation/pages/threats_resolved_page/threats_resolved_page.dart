import 'package:corporate_threat_detection/core/common/custom_app_bar.dart';
import 'package:corporate_threat_detection/features/threats/presentation/bloc/threats_cubit.dart';
import 'package:corporate_threat_detection/features/threats/presentation/bloc/threats_state.dart';
import 'package:corporate_threat_detection/features/threats/presentation/widgets/threats_list_body.dart';
import 'package:corporate_threat_detection/injector_container_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThreatsResolvedPage extends StatefulWidget {
  const ThreatsResolvedPage({super.key});

  @override
  State<ThreatsResolvedPage> createState() => _ThreatsResolvedPageState();
}

class _ThreatsResolvedPageState extends State<ThreatsResolvedPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThreatsCubit>(
      create: (_) => sl<ThreatsCubit>()..startRealtimeByStatus('resolved'),
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
          appBar: CustomAppBar(title: 'Resolved Threats'),
          body: ThreatsListBody(showResolved: true),
        ),
      ),
    );
  }
}
