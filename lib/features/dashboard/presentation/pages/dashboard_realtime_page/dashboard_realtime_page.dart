import 'package:corporate_threat_detection/core/common/custom_app_bar.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/bloc/dashboard_realtime_cubit.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/bloc/dashboard_realtime_state.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/pages/dashboard_realtime_page/dashboard_realtime_body.dart';
import 'package:corporate_threat_detection/injector_container_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardRealtimePage extends StatefulWidget {
  const DashboardRealtimePage({super.key});

  @override
  State<DashboardRealtimePage> createState() => _DashboardRealtimePageState();
}

class _DashboardRealtimePageState extends State<DashboardRealtimePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DashboardRealtimeCubit>(
      create: (_) => sl<DashboardRealtimeCubit>()..startRealtime(),
      child: BlocListener<DashboardRealtimeCubit, DashboardRealtimeState>(
        listenWhen: (prev, next) =>
            prev.errorMessage != next.errorMessage &&
            next.errorMessage != null,
        listener: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage!)),
          );
        },
        child: const Scaffold(
          appBar: CustomAppBar(title: 'Realtime Monitoring'),
          body: DashboardRealtimeBody(),
        ),
      ),
    );
  }
}
