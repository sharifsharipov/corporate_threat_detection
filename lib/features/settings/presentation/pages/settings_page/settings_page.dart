import 'package:corporate_threat_detection/core/common/custom_app_bar.dart';
import 'package:corporate_threat_detection/features/settings/presentation/pages/settings_page/settings_body.dart';
import 'package:corporate_threat_detection/features/settings/presentation/pages/settings_page/settings_mixin.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/widgets/dashboard_drawer.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> with SettingsMixin {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CustomAppBar(
      title: 'Settings',
      leadingVisible: true,
      customLeading: false,
    ),
    drawer: const DashboardDrawer(),
    body: SettingsBody(mixin: this),
  );
}
