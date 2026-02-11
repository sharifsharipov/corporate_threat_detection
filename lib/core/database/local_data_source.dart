import "dart:io";

import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:hive/hive.dart";
import "package:corporate_threat_detection/constants/app_keys.dart";

final class LocalSource {
  LocalSource(this.box) {
    _listenToAccessToken();
  }

  final Box<dynamic> box;
  final ValueNotifier<String> accessTokenNotifier = ValueNotifier("");

  void _listenToAccessToken() {
    accessTokenNotifier.value = accessToken;

    box.watch(key: AppKeys.accessToken).listen((event) {
      final newToken = event.value as String? ?? "";
      if (newToken != accessTokenNotifier.value) {
        accessTokenNotifier.value = newToken;
      }
    });
  }

  bool get hasProfile => box.get(AppKeys.hasProfile, defaultValue: false);

  Future<void> setHasProfile({required bool value}) async {
    await box.put(AppKeys.hasProfile, value);
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    await box.put(AppKeys.themeMode, mode.name);
  }

  ThemeMode getThemeMode() {
    final String? themeName = box.get(AppKeys.themeMode);
    switch (themeName) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  Future<void> setLocale(Locale locale) async {
    await box.put(AppKeys.locale, locale.languageCode);
  }

  Locale getLocale() {
    final String? languageCode = box.get(AppKeys.locale);

    /// if language not selected, use device language as app language
    if (languageCode == null) {
      if (kIsWeb) return const Locale('uz');
      final deviceLang = Platform.localeName.split('_').first;
      switch (deviceLang) {
        case 'uz':
          return const Locale('uz');
        case 'ru':
          return const Locale('ru');
        case 'en':
          return const Locale('en');
        case 'fr':
          return const Locale('fr');
        default:
          return const Locale('uz');
      }
    }

    switch (languageCode) {
      case 'uz':
        return const Locale('uz');
      case 'ru':
        return const Locale('ru');
      case 'en':
        return const Locale('en');
      case 'fr':
        return const Locale('fr');
      default:
        return const Locale('uz');
    }
  }

  Future<void> setAccessToken(String accessToken) async {
    await box.put(AppKeys.accessToken, accessToken);
    // Verify the token was saved
    final saved = box.get(AppKeys.accessToken, defaultValue: "");
    debugPrint("LocalSource: Access token saved. Length: ${saved.length}");
  }

  String get accessToken => box.get(AppKeys.accessToken, defaultValue: "");

  Future<void> setRefreshToken(String refreshToken) async {
    await box.put(AppKeys.refreshToken, refreshToken);
  }

  String get refreshToken => box.get(AppKeys.refreshToken, defaultValue: "");

  Future<void> deleteRefreshToken() async {
    await box.delete(AppKeys.refreshToken);
  }

  Future<void> setPhoneNumber(String phoneNumber) async {
    await box.put(AppKeys.phoneNumber, phoneNumber);
  }

  String get phoneNumber => box.get(AppKeys.phoneNumber, defaultValue: "");
  Future<void> setUserId(int id) async {
    await box.put(AppKeys.userId, id);
  }

  int get getUserId => box.get(AppKeys.userId, defaultValue: 0);
  Future<void> setIndex(int id) async {
    await box.put(AppKeys.index, id);
  }

  int get getUserIndex => box.get(AppKeys.index, defaultValue: 0);

  Future<void> removeIndex() async {
    await box.delete(AppKeys.index);
  }

  Future<void> setFirstName(String firstName) async {
    await box.put(AppKeys.firstname, firstName);
  }

  String getFirstName() => box.get(AppKeys.firstname, defaultValue: "");

  Future<void> setLastName(String lastName) async {
    await box.put(AppKeys.lastname, lastName);
  }

  String getLastName() => box.get(AppKeys.lastname, defaultValue: "");
  Future<void> gender(String gender) async {
    await box.put(AppKeys.gender, gender);
  }

  String getGender() => box.get(AppKeys.gender, defaultValue: "");
  Future<void> setEmail(String email) async {
    await box.put(AppKeys.email, email);
  }

  String get email => box.get(AppKeys.email, defaultValue: "");

  Future<void> setPassword(String password) async {
    await box.put(AppKeys.password, password);
  }

  String? get password => box.get(AppKeys.password);

  Future<void> deleteToken() async {
    await box.delete(AppKeys.accessToken);
  }

  Future<void> clear() async {
    await box.clear();
  }
}
