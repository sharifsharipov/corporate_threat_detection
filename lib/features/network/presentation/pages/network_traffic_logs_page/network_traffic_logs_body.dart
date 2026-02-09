import 'package:corporate_threat_detection/features/network/presentation/bloc/network_traffic_logs_cubit.dart';
import 'package:corporate_threat_detection/features/network/presentation/bloc/network_traffic_logs_state.dart';
import 'package:corporate_threat_detection/features/network/presentation/pages/network_traffic_logs_page/widgets/traffic_log_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NetworkTrafficLogsBody extends StatelessWidget {
  const NetworkTrafficLogsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NetworkTrafficLogsCubit, NetworkTrafficLogsState>(
      builder: (context, state) {
        if (state.isLoading && state.logs.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.errorMessage != null && state.logs.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    state.errorMessage!,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed:
                        context.read<NetworkTrafficLogsCubit>().startRealtime,
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          );
        }

        if (state.logs.isEmpty) {
          return Center(
            child: Text(
              'No traffic logs found',
              style: TextStyle(color: Colors.grey.shade600),
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: state.logs.length,
          itemBuilder: (context, index) {
            final log = state.logs[index];
            return TrafficLogItem(log: log);
          },
        );
      },
    );
  }
}
