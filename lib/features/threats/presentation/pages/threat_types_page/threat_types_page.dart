import 'package:corporate_threat_detection/core/common/custom_app_bar.dart';
import 'package:corporate_threat_detection/features/threats/presentation/bloc/threat_types_cubit.dart';
import 'package:corporate_threat_detection/features/threats/presentation/bloc/threat_types_state.dart';
import 'package:corporate_threat_detection/features/threats/presentation/pages/threat_types_page/threat_types_body.dart';
import 'package:corporate_threat_detection/injector_container_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThreatTypesPage extends StatefulWidget {
  const ThreatTypesPage({super.key});

  @override
  State<ThreatTypesPage> createState() => _ThreatTypesPageState();
}

class _ThreatTypesPageState extends State<ThreatTypesPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThreatTypesCubit>(
      create: (_) => sl<ThreatTypesCubit>()..startRealtime(),
      child: BlocListener<ThreatTypesCubit, ThreatTypesState>(
        listenWhen: (prev, next) =>
            prev.errorMessage != next.errorMessage &&
            next.errorMessage != null,
        listener: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage!)),
          );
        },
        child: const Scaffold(
          appBar: CustomAppBar(title: 'Threat Types'),
          body: ThreatTypesBody(),
        ),
      ),
    );
  }
}
