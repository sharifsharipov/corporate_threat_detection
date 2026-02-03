import 'package:corporate_threat_detection/core/themes/colors/app_colors.dart';
import 'package:corporate_threat_detection/features/settings/presentation/pages/settings_page/settings_mixin.dart';
import 'package:corporate_threat_detection/features/settings/presentation/pages/settings_page/widgets/settings_section.dart';
import 'package:corporate_threat_detection/features/settings/presentation/pages/settings_page/widgets/settings_tile.dart';
import 'package:corporate_threat_detection/features/settings/presentation/pages/settings_page/widgets/user_profile_header.dart';
import 'package:flutter/material.dart';

class SettingsBody extends StatelessWidget {
  final SettingsMixin mixin;

  const SettingsBody({super.key, required this.mixin});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.c_f0f2f4,
      child: SingleChildScrollView(
        child: Column(
          children: [
            // User Profile
            UserProfileHeader(
              name: mixin.userName,
              email: mixin.userEmail,
              role: mixin.userRole,
              avatarUrl: mixin.userAvatarUrl,
              onEditProfile: mixin.handleEditProfile,
            ),

            // General Settings
            SettingsSection(
              title: 'General',
              children: [
                SettingsTile(
                  icon: Icons.language,
                  title: 'Language',
                  type: SettingsTileType.info,
                  infoValue: mixin.language,
                  onTap: mixin.handleLanguageChange,
                ),
                Divider(height: 1, indent: 60, color: Colors.grey.shade100),
                SettingsTile(
                  icon: Icons.dark_mode_outlined,
                  title: 'Dark Mode',
                  type: SettingsTileType.switchType,
                  switchValue: mixin.darkMode,
                  onSwitchChanged: mixin.toggleDarkMode,
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
                  switchValue: mixin.pushNotifications,
                  onSwitchChanged: mixin.togglePushNotifications,
                  iconColor: AppColors.c_F7931E,
                ),
                Divider(height: 1, indent: 60, color: Colors.grey.shade100),
                SettingsTile(
                  icon: Icons.email_outlined,
                  title: 'Email Notifications',
                  subtitle: 'Receive daily usage summaries',
                  type: SettingsTileType.switchType,
                  switchValue: mixin.emailNotifications,
                  onSwitchChanged: mixin.toggleEmailNotifications,
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
                  switchValue: mixin.biometricAuth,
                  onSwitchChanged: mixin.toggleBiometricAuth,
                  iconColor: AppColors.buttonColor,
                ),
                Divider(height: 1, indent: 60, color: Colors.grey.shade100),
                SettingsTile(
                  icon: Icons.password,
                  title: 'Change Password',
                  type: SettingsTileType.navigation,
                  onTap: mixin.handleChangePassword,
                  iconColor: Colors.grey.shade700,
                ),
                Divider(height: 1, indent: 60, color: Colors.grey.shade100),
                SettingsTile(
                  icon: Icons.security,
                  title: 'Two-Factor Authentication',
                  type: SettingsTileType.switchType,
                  switchValue: mixin.twoFactorAuth,
                  onSwitchChanged: mixin.toggleTwoFactorAuth,
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
                  onTap: () {
                    // Navigate to about page
                  },
                ),
                Divider(height: 1, indent: 60, color: Colors.grey.shade100),
                SettingsTile(
                  icon: Icons.privacy_tip_outlined,
                  title: 'Privacy Policy',
                  type: SettingsTileType.navigation,
                  onTap: () {
                    // Navigate to privacy policy
                  },
                ),
                Divider(height: 1, indent: 60, color: Colors.grey.shade100),
                SettingsTile(
                  icon: Icons.description_outlined,
                  title: 'Terms of Service',
                  type: SettingsTileType.navigation,
                  onTap: () {
                    // Navigate to terms
                  },
                ),
              ],
            ),

            const SizedBox(height: 30),

            // Logout Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: mixin.handleLogout,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.c_F71E52.withOpacity(0.1),
                  foregroundColor: AppColors.c_F71E52,
                  elevation: 0,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Log Out',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // App Version
            Center(
              child: Text(
                'Version 1.0.0 (Build 124)',
                style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
