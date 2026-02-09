import 'package:corporate_threat_detection/core/themes/colors/app_colors.dart';
import 'package:corporate_threat_detection/features/threats/presentation/bloc/threat_types_cubit.dart';
import 'package:corporate_threat_detection/features/threats/presentation/bloc/threat_types_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThreatTypesBody extends StatelessWidget {
  const ThreatTypesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThreatTypesCubit, ThreatTypesState>(
      builder: (context, state) {
        if (state.isLoading && state.summaries.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.errorMessage != null && state.summaries.isEmpty) {
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
                        context.read<ThreatTypesCubit>().startRealtime,
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          );
        }

        if (state.summaries.isEmpty) {
          return Center(
            child: Text(
              'No threat types found',
              style: TextStyle(color: Colors.grey.shade600),
            ),
          );
        }

        return Container(
          color: AppColors.c_f0f2f4,
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: state.summaries.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final summary = state.summaries[index];
              return _ThreatTypeCard(summary: summary);
            },
          ),
        );
      },
    );
  }
}

class _ThreatTypeCard extends StatelessWidget {
  final ThreatTypeSummary summary;

  const _ThreatTypeCard({required this.summary});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  summary.type,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.buttonColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  '${summary.total}',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.buttonColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 6,
            children: [
              _buildChip('Critical', summary.critical, const Color(0xFF8B0000)),
              _buildChip('High', summary.high, AppColors.c_F71E52),
              _buildChip('Medium', summary.medium, AppColors.c_F7931E),
              _buildChip('Low', summary.low, AppColors.c_03A64B),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChip(String label, int count, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        '$label: $count',
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}
