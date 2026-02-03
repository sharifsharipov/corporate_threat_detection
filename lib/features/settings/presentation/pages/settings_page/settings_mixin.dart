import 'package:corporate_threat_detection/features/settings/presentation/pages/settings_page/settings_page.dart';
import 'package:flutter/material.dart';

mixin SettingsMixin on State<SettingsPage> {
  // User Profile
  final String userName = 'Sharif Sharipov';
  final String userEmail = 'sharif@example.com';
  final String userRole = 'Security Admin';
  final String userAvatarUrl = ''; // Use empty for default initial

  // App Settings
  bool _darkMode = false;
  bool _pushNotifications = true;
  bool _emailNotifications = true;
  bool _biometricAuth = true;
  bool _twoFactorAuth = false;
  String _language = 'English';

  // Getters
  bool get darkMode => _darkMode;
  bool get pushNotifications => _pushNotifications;
  bool get emailNotifications => _emailNotifications;
  bool get biometricAuth => _biometricAuth;
  bool get twoFactorAuth => _twoFactorAuth;
  String get language => _language;

  // Handlers
  void toggleDarkMode(bool value) {
    setState(() {
      _darkMode = value;
    });
    // Implement dark mode logic
  }

  void togglePushNotifications(bool value) {
    setState(() {
      _pushNotifications = value;
    });
  }

  void toggleEmailNotifications(bool value) {
    setState(() {
      _emailNotifications = value;
    });
  }

  void toggleBiometricAuth(bool value) {
    setState(() {
      _biometricAuth = value;
    });
  }

  void toggleTwoFactorAuth(bool value) {
    setState(() {
      _twoFactorAuth = value;
    });
  }

  void handleEditProfile() {
    // Navigate to edit profile
    debugPrint('Edit profile clicked');
  }

  void handleLanguageChange() {
    // Show language picker
    debugPrint('Language change clicked');
  }

  void handleChangePassword() {
    // Navigate to change password
    debugPrint('Change password clicked');
  }

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
              // Implement actual logout
              debugPrint('Logged out');
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
