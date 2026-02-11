import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:corporate_threat_detection/constants/constants.dart';

Future<String> getDeviceId() async {
  if (Constants.deviceId != null) {
    return Constants.deviceId!;
  }

  final deviceInfo = DeviceInfoPlugin();
  String deviceId;

  try {
    if (kIsWeb) {
      deviceId = 'web-browser';
      if (kDebugMode) debugPrint('Web Device ID: $deviceId');
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      deviceId = iosInfo.identifierForVendor?.isNotEmpty ?? false
          ? iosInfo.identifierForVendor!
          : 'unknown';
      if (kDebugMode) debugPrint('iOS Device ID: $deviceId');
    } else if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      deviceId = androidInfo.id.isNotEmpty ? androidInfo.id : 'unknown';
      if (kDebugMode) debugPrint('Android Device ID: $deviceId');
    } else {
      deviceId = 'unknown';
      if (kDebugMode) debugPrint('Unsupported platform Device ID: $deviceId');
    }
  } catch (e) {
    deviceId = 'unknown';
    if (kDebugMode) debugPrint('Error getting Device ID: $e');
  }

  Constants.deviceId = deviceId;
  if (kDebugMode) debugPrint('Device ID assigned: ${Constants.deviceId}');
  return deviceId;
}
