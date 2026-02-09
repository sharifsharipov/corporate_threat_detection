import 'package:corporate_threat_detection/core/common/custom_app_bar.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/widgets/dashboard_drawer.dart';
import 'package:corporate_threat_detection/features/settings/presentation/bloc/alerts_cubit.dart';
import 'package:corporate_threat_detection/features/settings/presentation/bloc/alerts_state.dart';
import 'package:corporate_threat_detection/features/settings/presentation/pages/alerts_page/alerts_body.dart';
import 'package:corporate_threat_detection/injector_container_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlertsPage extends StatefulWidget {
  const AlertsPage({super.key});

  @override
  State<AlertsPage> createState() => _AlertsPageState();
}

class _AlertsPageState extends State<AlertsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AlertsCubit>(
      create: (_) => sl<AlertsCubit>()..startRealtime(),
      child: BlocListener<AlertsCubit, AlertsState>(
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
            title: 'Alerts',
            leadingVisible: true,
            customLeading: false,
          ),
          drawer: DashboardDrawer(),
          body: AlertsBody(),
        ),
      ),
    );
  }
}
