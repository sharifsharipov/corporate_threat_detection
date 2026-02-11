import 'package:corporate_threat_detection/core/themes/colors/app_colors.dart';
import 'package:corporate_threat_detection/features/threats/data/models/threat/threat.dart';
import 'package:corporate_threat_detection/features/threats/presentation/bloc/threats_cubit.dart';
import 'package:corporate_threat_detection/features/threats/presentation/bloc/threats_state.dart';
import 'package:corporate_threat_detection/features/threats/presentation/pages/threats_active_page/threats_active_mixin.dart';
import 'package:corporate_threat_detection/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class ThreatsActiveBody extends StatelessWidget {
  final ThreatsActiveMixin mixin;

  const ThreatsActiveBody({super.key, required this.mixin});

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
            onRetry: () =>
                context.read<ThreatsCubit>().startRealtimeByStatus('active'),
          );
        }

        final filtered = mixin.applyFilters(state.threats);
        final criticalCount = state.threats
            .where((threat) => threat.riskLevel.toLowerCase() == 'critical')
            .length;
        final highCount = state.threats
            .where((threat) => threat.riskLevel.toLowerCase() == 'high')
            .length;

        return RefreshIndicator(
          onRefresh: () async {
            context.read<ThreatsCubit>().startRealtimeByStatus('active');
          },
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
            children: [
              _SummarySection(
                totalCount: state.threats.length,
                criticalCount: criticalCount,
                highCount: highCount,
              ),
              const SizedBox(height: 16),
              _SearchField(mixin: mixin),
              const SizedBox(height: 12),
              _FilterRow(mixin: mixin),
              const SizedBox(height: 12),
              if (filtered.isEmpty)
                const _EmptyFilteredState()
              else
                ...filtered.map(
                  (threat) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _ThreatCard(
                      threat: threat,
                      isUpdating: state.isUpdating,
                      onTap: () =>
                          context.goNamed(Routes.threatDetail, extra: threat),
                      onResolve: () => context
                          .read<ThreatsCubit>()
                          .updateThreatStatus(threat.threatId, 'resolved'),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class _SummarySection extends StatelessWidget {
  final int totalCount;
  final int criticalCount;
  final int highCount;

  const _SummarySection({
    required this.totalCount,
    required this.criticalCount,
    required this.highCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _SummaryCard(
            label: 'Active',
            value: totalCount.toString(),
            color: AppColors.buttonColor,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _SummaryCard(
            label: 'Critical',
            value: criticalCount.toString(),
            color: AppColors.c_F71E52,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _SummaryCard(
            label: 'High',
            value: highCount.toString(),
            color: AppColors.c_F7931E,
          ),
        ),
      ],
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _SummaryCard({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: color.withOpacity(0.1),
        border: Border.all(color: color.withOpacity(0.25)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              value,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  final ThreatsActiveMixin mixin;

  const _SearchField({required this.mixin});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: mixin.searchController,
      onChanged: mixin.onSearchChanged,
      decoration: InputDecoration(
        hintText: 'Search by ID, device, type, description',
        prefixIcon: const Icon(Icons.search),
        suffixIcon: mixin.searchController.text.isEmpty
            ? null
            : IconButton(
                onPressed: () {
                  mixin.searchController.clear();
                  mixin.onSearchChanged('');
                },
                icon: const Icon(Icons.close),
              ),
      ),
    );
  }
}

class _FilterRow extends StatelessWidget {
  final ThreatsActiveMixin mixin;

  const _FilterRow({required this.mixin});

  @override
  Widget build(BuildContext context) {
    final risks = <String>['all', 'critical', 'high', 'medium', 'low'];
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 36,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: risks.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final risk = risks[index];
                final selected = mixin.selectedRisk == risk;
                return ChoiceChip(
                  label: Text(_label(risk)),
                  selected: selected,
                  onSelected: (_) => mixin.onRiskChanged(risk),
                );
              },
            ),
          ),
        ),
        const SizedBox(width: 8),
        IconButton(
          onPressed: mixin.toggleSortOrder,
          tooltip: mixin.newestFirst ? 'Newest first' : 'Oldest first',
          icon: Icon(
            mixin.newestFirst ? Icons.south : Icons.north,
            color: AppColors.buttonColor,
          ),
        ),
      ],
    );
  }

  String _label(String risk) {
    if (risk == 'all') {
      return 'All';
    }
    return '${risk[0].toUpperCase()}${risk.substring(1)}';
  }
}

class _ThreatCard extends StatelessWidget {
  final Threat threat;
  final bool isUpdating;
  final VoidCallback onTap;
  final VoidCallback onResolve;

  const _ThreatCard({
    required this.threat,
    required this.isUpdating,
    required this.onTap,
    required this.onResolve,
  });

  @override
  Widget build(BuildContext context) {
    final dateText = DateFormat('MMM d, HH:mm').format(threat.detectedAt);
    final riskColor = _riskColor(threat.riskLevel.toLowerCase());

    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      elevation: 1.5,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      threat.threatId,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  _Badge(
                    text: threat.riskLevel.toUpperCase(),
                    color: riskColor,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                threat.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8,
                runSpacing: 6,
                children: [
                  _MetaChip(icon: Icons.memory, text: threat.deviceId),
                  _MetaChip(icon: Icons.security, text: threat.type),
                  _MetaChip(icon: Icons.bolt, text: threat.detectionMethod),
                  _MetaChip(icon: Icons.schedule, text: dateText),
                ],
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: FilledButton.icon(
                  onPressed: isUpdating ? null : onResolve,
                  icon: isUpdating
                      ? const SizedBox(
                          width: 14,
                          height: 14,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.check_circle_outline),
                  label: const Text('Mark Resolved'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _riskColor(String riskLevel) {
    switch (riskLevel) {
      case 'critical':
        return AppColors.c_F71E52;
      case 'high':
        return AppColors.c_F7931E;
      case 'medium':
        return Colors.amber.shade700;
      case 'low':
        return AppColors.c_03A64B;
      default:
        return AppColors.c_5B6D83;
    }
  }
}

class _Badge extends StatelessWidget {
  final String text;
  final Color color;

  const _Badge({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Text(
          text,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w700,
            fontSize: 11,
            letterSpacing: 0.2,
          ),
        ),
      ),
    );
  }
}

class _MetaChip extends StatelessWidget {
  final IconData icon;
  final String text;

  const _MetaChip({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.c_f0f2f4,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 13, color: AppColors.c_5B6D83),
            const SizedBox(width: 5),
            Text(
              text,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.c_5B6D83,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyFilteredState extends StatelessWidget {
  const _EmptyFilteredState();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Column(
        children: const [
          Icon(Icons.search_off, size: 48, color: AppColors.c_5B6D83),
          SizedBox(height: 8),
          Text('No threats match current filters.'),
        ],
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
            ElevatedButton(onPressed: onRetry, child: const Text('Retry')),
          ],
        ),
      ),
    );
  }
}
