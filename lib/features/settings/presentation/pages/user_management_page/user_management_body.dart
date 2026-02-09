import 'package:corporate_threat_detection/core/themes/colors/app_colors.dart';
import 'package:corporate_threat_detection/features/settings/data/models/user_profile_model/user_profile_model.dart';
import 'package:corporate_threat_detection/features/settings/presentation/bloc/user_management_cubit.dart';
import 'package:corporate_threat_detection/features/settings/presentation/bloc/user_management_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class UserManagementBody extends StatelessWidget {
  const UserManagementBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserManagementCubit, UserManagementState>(
      builder: (context, state) {
        if (state.isLoading && state.users.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.errorMessage != null && state.users.isEmpty) {
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
                        context.read<UserManagementCubit>().startRealtime,
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          );
        }

        if (state.users.isEmpty) {
          return Center(
            child: Text(
              'No users found',
              style: TextStyle(color: Colors.grey.shade600),
            ),
          );
        }

        return Container(
          color: AppColors.c_f0f2f4,
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: state.users.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final user = state.users[index];
              return _UserCard(user: user);
            },
          ),
        );
      },
    );
  }
}

class _UserCard extends StatelessWidget {
  final UserProfileModel user;

  const _UserCard({required this.user});

  @override
  Widget build(BuildContext context) {
    final lastLogin = user.lastLogin != null
        ? DateFormat('MMM d, yyyy • HH:mm').format(user.lastLogin!)
        : 'Never';

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
              CircleAvatar(
                radius: 18,
                backgroundColor: AppColors.buttonColor.withValues(alpha: 0.15),
                foregroundColor: AppColors.buttonColor,
                child: Text(
                  user.displayName.isNotEmpty
                      ? user.displayName.characters.first.toUpperCase()
                      : user.email.isNotEmpty
                          ? user.email.characters.first.toUpperCase()
                          : '?',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.displayName.isNotEmpty
                          ? user.displayName
                          : 'Unnamed User',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      user.email,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              Switch(
                value: user.isActive,
                onChanged: (value) => context
                    .read<UserManagementCubit>()
                    .toggleActive(user, value),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.person_outline, size: 16, color: Colors.grey),
              const SizedBox(width: 6),
              Text(
                'Role',
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
              ),
              const SizedBox(width: 8),
              _RoleDropdown(user: user),
              const Spacer(),
              Text(
                'Last login: $lastLogin',
                style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _RoleDropdown extends StatelessWidget {
  final UserProfileModel user;

  const _RoleDropdown({required this.user});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<UserRole>(
      value: user.role,
      onChanged: (role) {
        if (role == null) {
          return;
        }
        context.read<UserManagementCubit>().updateRole(user, role);
      },
      underline: const SizedBox.shrink(),
      items: UserRole.values
          .map(
            (role) => DropdownMenuItem(
              value: role,
              child: Text(
                role.name.toUpperCase(),
                style: const TextStyle(fontSize: 12),
              ),
            ),
          )
          .toList(),
    );
  }
}
