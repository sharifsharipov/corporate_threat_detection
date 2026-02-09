import "dart:io";
import "package:firebase_core/firebase_core.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:corporate_threat_detection/app.dart" show App;
import "package:corporate_threat_detection/core/helper/device_id.dart";
import "package:corporate_threat_detection/core/utils/utils.dart";
import "package:corporate_threat_detection/firebase_options.dart";
import "package:corporate_threat_detection/injector_container_path.dart" as di;
//import "package:tomu/service/notification_service.dart";

Future<void> main() async {
  /// flutter_native_splash
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  // FlutterNativeSplash.preserve(widgetsBinding: binding);

  /// notification initialize
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await NotificationService.initialize();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  debugPrint("Device id :${await getDeviceId()}");

  /// bloc logger
  if (kDebugMode) {
    Bloc.observer = LogBlocObserver();
  }

  /// global CERTIFICATE_VERIFY_FAILEd_KEY
  HttpOverrides.global = _HttpOverrides();
  runApp(App());
}

class _HttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) =>
      super.createHttpClient(context)
        ..badCertificateCallback = (_, __, ___) => true;
}

/// flutter pub run flutter_launcher_icons:main
/// flutter run -d windows
/// flutter run --release
/// flutter build apk --release
/// flutter build apk --split-per-abi
/// flutter build appbundle --release
/// flutter pub run build_runner watch --delete-conflicting-outputs
/// flutter pub ipa
/// dart fix --apply151
/// flutter run -d chrome
//FlutterNativeSplash.remove();
