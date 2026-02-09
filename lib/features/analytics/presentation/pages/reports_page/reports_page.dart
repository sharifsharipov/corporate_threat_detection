import 'package:corporate_threat_detection/core/common/custom_app_bar.dart';
import 'package:corporate_threat_detection/features/analytics/presentation/bloc/reports_cubit.dart';
import 'package:corporate_threat_detection/features/analytics/presentation/bloc/reports_state.dart';
import 'package:corporate_threat_detection/features/analytics/presentation/pages/reports_page/reports_body.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/widgets/dashboard_drawer.dart';
import 'package:corporate_threat_detection/injector_container_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({super.key});

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ReportsCubit>(
      create: (_) => sl<ReportsCubit>()..startRealtime(),
      child: BlocListener<ReportsCubit, ReportsState>(
        listenWhen: (prev, next) =>
            prev.errorMessage != next.errorMessage &&
            next.errorMessage != null,
        listener: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage!)),
          );
        },
        child: const Scaffold(
          appBar: CustomAppBar(
            title: 'Reports',
            leadingVisible: true,
            customLeading: false,
          ),
          drawer: DashboardDrawer(),
          body: ReportsBody(),
        ),
      ),
    );
  }
}
