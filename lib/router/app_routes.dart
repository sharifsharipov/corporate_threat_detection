part of 'routes.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

final PackageInfo packageInfo = sl<PackageInfo>();
final NetworkInfo networkInfo = sl<NetworkInfo>();
final LocalSource localSource = sl<LocalSource>();

final Chuck chuck = Chuck(
  navigatorKey: rootNavigatorKey,
  showNotification: true,
);
final GoRouter router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: Routes.initial,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: Routes.initial,
      name: Routes.initial,
      builder: (context, state) => const DashboardOverviewPage(),
    ),
    GoRoute(
      path: Routes.login,
      name: Routes.login,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: Routes.register,
      name: Routes.register,
      builder: (context, state) => const RegisterPage(),
    ),
    GoRoute(
      path: Routes.forgotPassword,
      name: Routes.forgotPassword,
      builder: (context, state) => const ForgotPasswordPage(),
    ),

    GoRoute(
      path: Routes.dashboardOverview,
      name: Routes.dashboardOverview,
      builder: (context, state) => const DashboardOverviewPage(),
    ),
    GoRoute(
      path: Routes.dashboardRealtime,
      name: Routes.dashboardRealtime,
      builder: (context, state) => const DashboardRealtimePage(),
    ),
    GoRoute(
      path: Routes.dashboardThreatSummary,
      name: Routes.dashboardThreatSummary,
      builder: (context, state) => const DashboardThreatSummaryPage(),
    ),

    GoRoute(
      path: Routes.analytics,
      name: Routes.analytics,
      builder: (context, state) => const AnalyticsPage(),
    ),
    GoRoute(
      path: Routes.reports,
      name: Routes.reports,
      builder: (context, state) => const ReportsPage(),
    ),
    GoRoute(
      path: Routes.threatsActive,
      name: Routes.threatsActive,
      builder: (context, state) => const ThreatsActivePage(),
    ),
    GoRoute(
      path: Routes.threatsResolved,
      name: Routes.threatsResolved,
      builder: (context, state) => const ThreatsResolvedPage(),
    ),
    GoRoute(
      path: Routes.threatDetail,
      name: Routes.threatDetail,
      builder: (context, state) => const ThreatDetailPage(),
    ),
    GoRoute(
      path: Routes.threatTypes,
      name: Routes.threatTypes,
      builder: (context, state) => const ThreatTypesPage(),
    ),
    GoRoute(
      path: Routes.networkDevices,
      name: Routes.networkDevices,
      builder: (context, state) => const NetworkDevicesPage(),
    ),
    GoRoute(
      path: Routes.deviceDetail,
      name: Routes.deviceDetail,
      builder: (context, state) => const DeviceDetailPage(),
    ),
    GoRoute(
      path: Routes.deviceApiUsage,
      name: Routes.deviceApiUsage,
      builder: (context, state) => const DeviceApiUsagePage(),
    ),
    GoRoute(
      path: Routes.networkProtocols,
      name: Routes.networkProtocols,
      builder: (context, state) => const NetworkProtocolsPage(),
    ),
    GoRoute(
      path: Routes.networkTrafficLogs,
      name: Routes.networkTrafficLogs,
      builder: (context, state) => const NetworkTrafficLogsPage(),
    ),
    GoRoute(
      path: Routes.methodAnomaly,
      name: Routes.methodAnomaly,
      builder: (context, state) => const MethodAnomalyPage(),
    ),
    GoRoute(
      path: Routes.methodBehavior,
      name: Routes.methodBehavior,
      builder: (context, state) => const MethodBehaviorPage(),
    ),
    GoRoute(
      path: Routes.methodRule,
      name: Routes.methodRule,
      builder: (context, state) => const MethodRulePage(),
    ),
    GoRoute(
      path: Routes.methodSignature,
      name: Routes.methodSignature,
      builder: (context, state) => const MethodSignaturePage(),
    ),
    GoRoute(
      path: Routes.logs,
      name: Routes.logs,
      builder: (context, state) => const LogsPage(),
    ),
    GoRoute(
      path: Routes.history,
      name: Routes.history,
      builder: (context, state) => const HistoryPage(),
    ),
    GoRoute(
      path: Routes.alerts,
      name: Routes.alerts,
      builder: (context, state) => const AlertsPage(),
    ),
    GoRoute(
      path: Routes.settingsRules,
      name: Routes.settingsRules,
      builder: (context, state) => const SettingsRulesPage(),
    ),
    GoRoute(
      path: Routes.userManagement,
      name: Routes.userManagement,
      builder: (context, state) => const UserManagementPage(),
    ),
  ],
);
