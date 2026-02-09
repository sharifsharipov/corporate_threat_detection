import 'package:corporate_threat_detection/core/common/custom_app_bar.dart';
import 'package:corporate_threat_detection/features/settings/presentation/bloc/user_management_cubit.dart';
import 'package:corporate_threat_detection/features/settings/presentation/bloc/user_management_state.dart';
import 'package:corporate_threat_detection/features/settings/presentation/pages/user_management_page/user_management_body.dart';
import 'package:corporate_threat_detection/injector_container_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserManagementPage extends StatefulWidget {
  const UserManagementPage({super.key});

  @override
  State<UserManagementPage> createState() => _UserManagementPageState();
}

class _UserManagementPageState extends State<UserManagementPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserManagementCubit>(
      create: (_) => sl<UserManagementCubit>()..startRealtime(),
      child: BlocListener<UserManagementCubit, UserManagementState>(
        listenWhen: (prev, next) =>
            prev.errorMessage != next.errorMessage &&
            next.errorMessage != null,
        listener: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage!)),
          );
        },
        child: const Scaffold(
          appBar: CustomAppBar(title: 'User Management'),
          body: UserManagementBody(),
        ),
      ),
    );
  }
}
