import 'package:chuck_interceptor/chuck_interceptor.dart';
import 'package:corporate_threat_detection/core/connectivity/network_info.dart';
import 'package:corporate_threat_detection/core/database/local_data_source.dart';
import 'package:corporate_threat_detection/injector_container_path.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';

// Auth
import 'package:corporate_threat_detection/features/auth/presentation/pages/login_page/login_page.dart';
import 'package:corporate_threat_detection/features/auth/presentation/pages/register_page/register_page.dart';
import 'package:corporate_threat_detection/features/auth/presentation/pages/forgot_password_page/forgot_password_page.dart';

// Dashboard
import 'package:corporate_threat_detection/features/dashboard/presentation/pages/dashboard_overview_page/dashboard_overview_page.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/pages/dashboard_realtime_page/dashboard_realtime_page.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/pages/dashboard_threat_summary_page/dashboard_threat_summary_page.dart';

// Analytics
import 'package:corporate_threat_detection/features/analytics/presentation/pages/analytics_page/analytics_page.dart';
import 'package:corporate_threat_detection/features/analytics/presentation/pages/reports_page/reports_page.dart';

// Threats
import 'package:corporate_threat_detection/features/threats/presentation/pages/threats_active_page/threats_active_page.dart';
import 'package:corporate_threat_detection/features/threats/presentation/pages/threats_resolved_page/threats_resolved_page.dart';
import 'package:corporate_threat_detection/features/threats/presentation/pages/threat_detail_page/threat_detail_page.dart';
import 'package:corporate_threat_detection/features/threats/presentation/pages/threat_types_page/threat_types_page.dart';
import 'package:corporate_threat_detection/features/threats/data/models/threat/threat.dart';

// Network
import 'package:corporate_threat_detection/features/network/presentation/pages/network_devices_page/network_devices_page.dart';
import 'package:corporate_threat_detection/features/network/presentation/pages/device_detail_page/device_detail_page.dart';
import 'package:corporate_threat_detection/features/network/presentation/pages/device_api_usage_page/device_api_usage_page.dart';
import 'package:corporate_threat_detection/features/network/presentation/pages/network_protocols_page/network_protocols_page.dart';
import 'package:corporate_threat_detection/features/network/presentation/pages/network_traffic_logs_page/network_traffic_logs_page.dart';

// Methods
import 'package:corporate_threat_detection/features/methods/presentation/pages/method_anomaly_page/method_anomaly_page.dart';
import 'package:corporate_threat_detection/features/methods/presentation/pages/method_behavior_page/method_behavior_page.dart';
import 'package:corporate_threat_detection/features/methods/presentation/pages/method_rule_page/method_rule_page.dart';
import 'package:corporate_threat_detection/features/methods/presentation/pages/method_signature_page/method_signature_page.dart';

// Logs
import 'package:corporate_threat_detection/features/logs/presentation/pages/logs_page/logs_page.dart';
import 'package:corporate_threat_detection/features/logs/presentation/pages/history_page/history_page.dart';

// Settings
import 'package:corporate_threat_detection/features/settings/presentation/pages/alerts_page/alerts_page.dart';
import 'package:corporate_threat_detection/features/settings/presentation/pages/settings_rules_page/settings_rules_page.dart';
import 'package:corporate_threat_detection/features/settings/presentation/pages/user_management_page/user_management_page.dart';

part 'app_routes.dart';
part 'name_routes.dart';
