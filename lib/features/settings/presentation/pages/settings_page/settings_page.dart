import 'package:corporate_threat_detection/core/common/custom_app_bar.dart';
import 'package:corporate_threat_detection/core/database/local_data_source.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/widgets/dashboard_drawer.dart';
import 'package:corporate_threat_detection/features/settings/presentation/bloc/settings_cubit.dart';
import 'package:corporate_threat_detection/features/settings/presentation/bloc/settings_state.dart';
import 'package:corporate_threat_detection/features/settings/presentation/pages/settings_page/settings_body.dart';
import 'package:corporate_threat_detection/injector_container_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final LocalSource localSource = sl<LocalSource>();
    final int userId = localSource.getUserId;
    final String email = localSource.email;
    final String uid = email.isNotEmpty ? email : 'user_$userId';

    return BlocProvider<SettingsCubit>(
      create: (_) => sl<SettingsCubit>()..startRealtime(uid),
      child: BlocListener<SettingsCubit, SettingsState>(
        listenWhen: (prev, next) =>
            prev.errorMessage != next.errorMessage &&
            next.errorMessage != null,
        listener: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage!)),
          );
        },
        child: Scaffold(
          appBar: const CustomAppBar(
            title: 'Settings',
            leadingVisible: true,
            customLeading: false,
          ),
          drawer: const DashboardDrawer(),
          body: SettingsBody(uid: uid),
        ),
      ),
    );
  }
}
