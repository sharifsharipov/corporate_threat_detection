import 'package:corporate_threat_detection/core/common/custom_app_bar.dart';
import 'package:corporate_threat_detection/features/logs/presentation/pages/logs_page/logs_body.dart';
import 'package:corporate_threat_detection/features/logs/presentation/bloc/logs_cubit.dart';
import 'package:corporate_threat_detection/features/logs/presentation/bloc/logs_state.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/widgets/dashboard_drawer.dart';
import 'package:corporate_threat_detection/injector_container_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogsPage extends StatefulWidget {
  const LogsPage({super.key});

  @override
  State<LogsPage> createState() => _LogsPageState();
}

class _LogsPageState extends State<LogsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LogsCubit>(
      create: (_) => sl<LogsCubit>()..startRealtime(),
      child: BlocListener<LogsCubit, LogsState>(
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
            title: 'Logs',
            leadingVisible: true,
            customLeading: false,
          ),
          drawer: DashboardDrawer(),
          body: LogsBody(),
        ),
      ),
    );
  }
}
