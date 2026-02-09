import 'package:corporate_threat_detection/core/common/custom_app_bar.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/bloc/dashboard_threat_summary_cubit.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/bloc/dashboard_threat_summary_state.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/pages/dashboard_threat_summary_page/dashboard_threat_summary_body.dart';
import 'package:corporate_threat_detection/injector_container_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardThreatSummaryPage extends StatefulWidget {
  const DashboardThreatSummaryPage({super.key});

  @override
  State<DashboardThreatSummaryPage> createState() => _DashboardThreatSummaryPageState();
}

class _DashboardThreatSummaryPageState extends State<DashboardThreatSummaryPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DashboardThreatSummaryCubit>(
      create: (_) => sl<DashboardThreatSummaryCubit>()..startRealtime(),
      child: BlocListener<DashboardThreatSummaryCubit, DashboardThreatSummaryState>(
        listenWhen: (prev, next) =>
            prev.errorMessage != next.errorMessage &&
            next.errorMessage != null,
        listener: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage!)),
          );
        },
        child: const Scaffold(
          appBar: CustomAppBar(title: 'Threat Summary'),
          body: DashboardThreatSummaryBody(),
        ),
      ),
    );
  }
}
