import 'package:corporate_threat_detection/core/themes/themes.dart';
import 'package:corporate_threat_detection/core/utils/utils.dart';
import 'package:corporate_threat_detection/generated/l10n.dart';
import 'package:corporate_threat_detection/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  const App({super.key});
  static final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp.router(
      /// title
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: _scaffoldMessengerKey,
      showPerformanceOverlay: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,

      /// lang. state.selectedLanguage,
      locale: const Locale('uz'),
      supportedLocales: const [Locale('en'), Locale('ru'), Locale('uz')],
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      /// pages
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
