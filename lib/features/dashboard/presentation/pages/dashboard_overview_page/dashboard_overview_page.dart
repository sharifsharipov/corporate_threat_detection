import 'package:corporate_threat_detection/core/common/custom_app_bar.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/bloc/dashboard_overview_cubit.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/bloc/dashboard_overview_state.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/pages/dashboard_overview_page/dashboard_overview_body.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/widgets/dashboard_drawer.dart';
import 'package:corporate_threat_detection/injector_container_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardOverviewPage extends StatefulWidget {
  const DashboardOverviewPage({super.key});

  @override
  State<DashboardOverviewPage> createState() => _DashboardOverviewPageState();
}

class _DashboardOverviewPageState extends State<DashboardOverviewPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DashboardOverviewCubit>(
      create: (_) => sl<DashboardOverviewCubit>()..startRealtime(),
      child: BlocListener<DashboardOverviewCubit, DashboardOverviewState>(
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
            title: 'Dashboard Overview',
            leadingVisible: true,
            customLeading: false,
          ),
          drawer: DashboardDrawer(),
          body: DashboardOverviewBody(),
        ),
      ),
    );
  }
}
