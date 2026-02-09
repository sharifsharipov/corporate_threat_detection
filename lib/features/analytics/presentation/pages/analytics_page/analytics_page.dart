import 'package:corporate_threat_detection/core/common/custom_app_bar.dart';
import 'package:corporate_threat_detection/features/analytics/presentation/bloc/analytics_cubit.dart';
import 'package:corporate_threat_detection/features/analytics/presentation/bloc/analytics_state.dart';
import 'package:corporate_threat_detection/features/analytics/presentation/pages/analytics_page/analytics_body.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/widgets/dashboard_drawer.dart';
import 'package:corporate_threat_detection/injector_container_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({super.key});

  @override
  State<AnalyticsPage> createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AnalyticsCubit>(
      create: (_) => sl<AnalyticsCubit>()..startRealtime(),
      child: BlocListener<AnalyticsCubit, AnalyticsState>(
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
            title: 'Analytics',
            leadingVisible: true,
            customLeading: false,
          ),
          drawer: DashboardDrawer(),
          body: AnalyticsBody(),
        ),
      ),
    );
  }
}
