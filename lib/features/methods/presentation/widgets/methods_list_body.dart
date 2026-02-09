import 'package:corporate_threat_detection/core/themes/colors/app_colors.dart';
import 'package:corporate_threat_detection/features/methods/data/models/detection_method/detection_method.dart';
import 'package:corporate_threat_detection/features/methods/presentation/bloc/methods_cubit.dart';
import 'package:corporate_threat_detection/features/methods/presentation/bloc/methods_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class MethodsListBody extends StatelessWidget {
  const MethodsListBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MethodsCubit, MethodsState>(
      builder: (context, state) {
        if (state.isLoading && state.methods.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.errorMessage != null && state.methods.isEmpty) {
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
                    onPressed: () => context
                        .read<MethodsCubit>()
                        .startRealtime(type: state.activeType),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          );
        }

        if (state.methods.isEmpty) {
          return Center(
            child: Text(
              'No detection methods found',
              style: TextStyle(color: Colors.grey.shade600),
            ),
          );
        }

        return Container(
          color: AppColors.c_f0f2f4,
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: state.methods.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final method = state.methods[index];
              return _MethodCard(method: method);
            },
          ),
        );
      },
    );
  }
}

class _MethodCard extends StatelessWidget {
  final DetectionMethod method;

  const _MethodCard({required this.method});

  @override
  Widget build(BuildContext context) {
    final createdAt = method.createdAt != null
        ? DateFormat('MMM d, yyyy').format(method.createdAt!)
        : '—';
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
                  method.name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.buttonColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  method.type.toUpperCase(),
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: AppColors.buttonColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            method.description,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
          ),
          const SizedBox(height: 8),
          Text(
            'Created: $createdAt',
            style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
          ),
        ],
      ),
    );
  }
}
