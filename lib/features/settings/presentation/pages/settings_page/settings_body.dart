import 'package:corporate_threat_detection/core/themes/colors/app_colors.dart';
import 'package:corporate_threat_detection/features/settings/presentation/bloc/settings_cubit.dart';
import 'package:corporate_threat_detection/features/settings/presentation/bloc/settings_state.dart';
import 'package:corporate_threat_detection/features/settings/presentation/pages/settings_page/widgets/settings_section.dart';
import 'package:corporate_threat_detection/features/settings/presentation/pages/settings_page/widgets/settings_tile.dart';
import 'package:corporate_threat_detection/features/settings/presentation/pages/settings_page/widgets/user_profile_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsBody extends StatelessWidget {
  final String uid;

  const SettingsBody({super.key, required this.uid});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        final cubit = context.read<SettingsCubit>();
        final profile = state.profile;
        final name = profile?.displayName.isNotEmpty == true
            ? profile!.displayName
            : 'User';
        final email = profile?.email ?? '';
        final role = profile == null ? '' : cubit.roleLabel(profile.role);
        final avatarUrl = profile?.photoUrl ?? '';

        void handleLogout() {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Logout'),
              content: const Text('Are you sure you want to logout?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(foregroundColor: Colors.red),
                  child: const Text('Logout'),
                ),
              ],
            ),
          );
        }

        Future<void> handleLanguageChange() async {
          final selected = await showModalBottomSheet<String>(
            context: context,
            builder: (context) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: const Text('English'),
                  onTap: () => Navigator.pop(context, 'English'),
                ),
                ListTile(
                  title: const Text('Uzbek'),
                  onTap: () => Navigator.pop(context, 'Uzbek'),
                ),
                ListTile(
                  title: const Text('Russian'),
                  onTap: () => Navigator.pop(context, 'Russian'),
                ),
              ],
            ),
          );
          if (selected != null) {
            await cubit.updateStringSetting(
              SettingsCubit.keyLanguage,
              selected,
            );
          }
        }

        return Container(
          color: AppColors.c_f0f2f4,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // User Profile
                UserProfileHeader(
                  name: name,
                  email: email,
                  role: role,
                  avatarUrl: avatarUrl,
                  onEditProfile: () =>
                      cubit.updateUserProfile(uid: uid, displayName: name),
                ),

                // General Settings
                SettingsSection(
                  title: 'General',
                  children: [
                    SettingsTile(
                      icon: Icons.language,
                      title: 'Language',
                      type: SettingsTileType.info,
                      infoValue: cubit.getString(
                        SettingsCubit.keyLanguage,
                        fallback: 'English',
                      ),
                      onTap: handleLanguageChange,
                    ),
                    Divider(height: 1, indent: 60, color: Colors.grey.shade100),
                    SettingsTile(
                      icon: Icons.dark_mode_outlined,
                      title: 'Dark Mode',
                      type: SettingsTileType.switchType,
                      switchValue: cubit.getBool(
                        SettingsCubit.keyDarkMode,
                        fallback: false,
                      ),
                      onSwitchChanged: (value) => cubit.updateBoolSetting(
                        SettingsCubit.keyDarkMode,
                        value,
                      ),
                    ),
                  ],
                ),

                // Notifications
                SettingsSection(
                  title: 'Notifications',
                  children: [
                    SettingsTile(
                      icon: Icons.notifications_none,
                      title: 'Push Notifications',
                      subtitle: 'Receive alerts on your device',
                      type: SettingsTileType.switchType,
                      switchValue: cubit.getBool(
                        SettingsCubit.keyPushNotifications,
                        fallback: true,
                      ),
                      onSwitchChanged: (value) => cubit.updateBoolSetting(
                        SettingsCubit.keyPushNotifications,
                        value,
                      ),
                      iconColor: AppColors.c_F7931E,
                    ),
                    Divider(height: 1, indent: 60, color: Colors.grey.shade100),
                    SettingsTile(
                      icon: Icons.email_outlined,
                      title: 'Email Notifications',
                      subtitle: 'Receive daily usage summaries',
                      type: SettingsTileType.switchType,
                      switchValue: cubit.getBool(
                        SettingsCubit.keyEmailNotifications,
                        fallback: true,
                      ),
                      onSwitchChanged: (value) => cubit.updateBoolSetting(
                        SettingsCubit.keyEmailNotifications,
                        value,
                      ),
                      iconColor: AppColors.c_03A64B,
                    ),
                  ],
                ),

                // Security
                SettingsSection(
                  title: 'Security',
                  children: [
                    SettingsTile(
                      icon: Icons.fingerprint,
                      title: 'Biometric Authentication',
                      type: SettingsTileType.switchType,
                      switchValue: cubit.getBool(
                        SettingsCubit.keyBiometricAuth,
                        fallback: false,
                      ),
                      onSwitchChanged: (value) => cubit.updateBoolSetting(
                        SettingsCubit.keyBiometricAuth,
                        value,
                      ),
                      iconColor: AppColors.buttonColor,
                    ),
                    Divider(height: 1, indent: 60, color: Colors.grey.shade100),
                    SettingsTile(
                      icon: Icons.password,
                      title: 'Change Password',
                      type: SettingsTileType.navigation,
                      onTap: () {},
                      iconColor: Colors.grey.shade700,
                    ),
                    Divider(height: 1, indent: 60, color: Colors.grey.shade100),
                    SettingsTile(
                      icon: Icons.security,
                      title: 'Two-Factor Authentication',
                      type: SettingsTileType.switchType,
                      switchValue: cubit.getBool(
                        SettingsCubit.keyTwoFactorAuth,
                        fallback: false,
                      ),
                      onSwitchChanged: (value) => cubit.updateBoolSetting(
                        SettingsCubit.keyTwoFactorAuth,
                        value,
                      ),
                      iconColor: AppColors.c_F71E52,
                    ),
                  ],
                ),

                // About
                SettingsSection(
                  title: 'About',
                  children: [
                    SettingsTile(
                      icon: Icons.info_outline,
                      title: 'About App',
                      type: SettingsTileType.navigation,
                      onTap: () {},
                    ),
                    Divider(height: 1, indent: 60, color: Colors.grey.shade100),
                    SettingsTile(
                      icon: Icons.privacy_tip_outlined,
                      title: 'Privacy Policy',
                      type: SettingsTileType.navigation,
                      onTap: () {},
                    ),
                    Divider(height: 1, indent: 60, color: Colors.grey.shade100),
                    SettingsTile(
                      icon: Icons.description_outlined,
                      title: 'Terms of Service',
                      type: SettingsTileType.navigation,
                      onTap: () {},
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                // Logout Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: handleLogout,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.c_F71E52.withValues(alpha: 0.1),
                      foregroundColor: AppColors.c_F71E52,
                      elevation: 0,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Log Out',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // App Version
                Center(
                  child: Text(
                    'Version 1.0.0 (Build 124)',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        );
      },
    );
  }
}
