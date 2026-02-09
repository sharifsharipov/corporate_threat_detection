import 'package:corporate_threat_detection/core/common/custom_app_bar.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/widgets/dashboard_drawer.dart';
import 'package:corporate_threat_detection/features/logs/presentation/bloc/history_cubit.dart';
import 'package:corporate_threat_detection/features/logs/presentation/bloc/history_state.dart';
import 'package:corporate_threat_detection/features/logs/presentation/pages/history_page/history_body.dart';
import 'package:corporate_threat_detection/injector_container_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HistoryCubit>(
      create: (_) => sl<HistoryCubit>()..startRealtime(),
      child: BlocListener<HistoryCubit, HistoryState>(
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
            title: 'History',
            leadingVisible: true,
            customLeading: false,
          ),
          drawer: DashboardDrawer(),
          body: HistoryBody(),
        ),
      ),
    );
  }
}
