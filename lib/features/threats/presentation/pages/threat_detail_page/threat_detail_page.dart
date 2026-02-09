import 'package:corporate_threat_detection/core/common/custom_app_bar.dart';
import 'package:corporate_threat_detection/features/threats/data/models/threat/threat.dart';
import 'package:corporate_threat_detection/features/threats/presentation/bloc/threats_cubit.dart';
import 'package:corporate_threat_detection/features/threats/presentation/bloc/threats_state.dart';
import 'package:corporate_threat_detection/injector_container_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ThreatDetailPage extends StatefulWidget {
  final Threat? threat;

  const ThreatDetailPage({super.key, required this.threat});

  @override
  State<ThreatDetailPage> createState() => _ThreatDetailPageState();
}

class _ThreatDetailPageState extends State<ThreatDetailPage> {
  late final ThreatsCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = sl<ThreatsCubit>();
    if (widget.threat != null) {
      _cubit.fetchThreatById(widget.threat!.threatId);
    }
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThreatsCubit>.value(
      value: _cubit,
      child: BlocListener<ThreatsCubit, ThreatsState>(
        listenWhen: (prev, next) =>
            prev.errorMessage != next.errorMessage && next.errorMessage != null,
        listener: (context, state) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
        },
        child: BlocBuilder<ThreatsCubit, ThreatsState>(
          builder: (context, state) {
            final threat = state.selectedThreat ?? widget.threat;
            if (threat == null) {
              return const Scaffold(
                appBar: CustomAppBar(title: 'Threat Details'),
                body: Center(child: Text('No threat data provided.')),
              );
            }

            final dateText = DateFormat(
              'yyyy-MM-dd HH:mm',
            ).format(threat.detectedAt);
            final status = threat.status.toLowerCase();
            final isResolved = status == 'resolved';
            final actionLabel = isResolved ? 'Reopen' : 'Resolve';
            final targetStatus = isResolved ? 'active' : 'resolved';

            return Scaffold(
              appBar: CustomAppBar(
                title: 'Threat Details',
                actions: TextButton(
                  onPressed: state.isUpdating
                      ? null
                      : () => context.read<ThreatsCubit>().updateThreatStatus(
                          threat.threatId,
                          targetStatus,
                        ),
                  child: state.isUpdating
                      ? const SizedBox(
                          height: 16,
                          width: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : Text(actionLabel),
                ),
              ),
              body: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  _DetailRow(label: 'Threat ID', value: threat.threatId),
                  _DetailRow(label: 'Device ID', value: threat.deviceId),
                  _DetailRow(label: 'Type', value: threat.type),
                  _DetailRow(label: 'Risk Level', value: threat.riskLevel),
                  _DetailRow(label: 'Status', value: threat.status),
                  _DetailRow(label: 'Detected At', value: dateText),
                  _DetailRow(
                    label: 'Detection Method',
                    value: threat.detectionMethod,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    threat.description,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 140,
            child: Text(label, style: Theme.of(context).textTheme.bodyMedium),
          ),
          Expanded(
            child: Text(value, style: Theme.of(context).textTheme.bodyLarge),
          ),
        ],
      ),
    );
  }
}
