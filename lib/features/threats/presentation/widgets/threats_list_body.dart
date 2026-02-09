import 'package:corporate_threat_detection/features/threats/data/models/threat/threat.dart';
import 'package:corporate_threat_detection/features/threats/presentation/bloc/threats_cubit.dart';
import 'package:corporate_threat_detection/features/threats/presentation/bloc/threats_state.dart';
import 'package:corporate_threat_detection/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class ThreatsListBody extends StatelessWidget {
  final bool showResolved;

  const ThreatsListBody({super.key, required this.showResolved});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThreatsCubit, ThreatsState>(
      builder: (context, state) {
        if (state.isLoading && state.threats.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.errorMessage != null && state.threats.isEmpty) {
          return _ErrorState(
            message: state.errorMessage!,
            onRetry: () => context.read<ThreatsCubit>().fetchThreats(),
          );
        }

        final threats = state.threats.where((threat) {
          final status = threat.status.toLowerCase();
          if (showResolved) {
            return status == 'resolved';
          }
          return status != 'resolved';
        }).toList();

        if (threats.isEmpty) {
          return const Center(child: Text('No threats found.'));
        }

        return RefreshIndicator(
          onRefresh: () => context.read<ThreatsCubit>().fetchThreats(),
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: threats.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final threat = threats[index];
              return _ThreatListItem(
                threat: threat,
                onTap: () =>
                    context.goNamed(Routes.threatDetail, extra: threat),
                onResolve: showResolved
                    ? null
                    : () => context
                        .read<ThreatsCubit>()
                        .updateThreatStatus(threat.threatId, 'resolved'),
                isUpdating: state.isUpdating,
              );
            },
          ),
        );
      },
    );
  }
}

class _ThreatListItem extends StatelessWidget {
  final Threat threat;
  final VoidCallback onTap;
  final VoidCallback? onResolve;
  final bool isUpdating;

  const _ThreatListItem({
    required this.threat,
    required this.onTap,
    required this.onResolve,
    required this.isUpdating,
  });

  @override
  Widget build(BuildContext context) {
    final dateText = DateFormat('yyyy-MM-dd HH:mm').format(threat.detectedAt);
    return Material(
      color: Theme.of(context).colorScheme.surface,
      elevation: 1,
      borderRadius: BorderRadius.circular(12),
      child: ListTile(
        onTap: onTap,
        title: Text(
          threat.description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          '${threat.type} • ${threat.riskLevel} • $dateText',
        ),
        trailing: onResolve == null
            ? const Icon(Icons.check_circle, color: Colors.green)
            : IconButton(
                icon: const Icon(Icons.done_all),
                tooltip: 'Mark resolved',
                onPressed: isUpdating ? null : onResolve,
              ),
      ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ErrorState({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: onRetry,
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
