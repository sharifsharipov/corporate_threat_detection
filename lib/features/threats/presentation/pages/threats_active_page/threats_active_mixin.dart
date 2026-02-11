import 'package:corporate_threat_detection/features/threats/presentation/pages/threats_active_page/threats_active_page.dart';
import 'package:corporate_threat_detection/features/threats/data/models/threat/threat.dart';
import 'package:flutter/material.dart';

mixin ThreatsActiveMixin on State<ThreatsActivePage> {
  final TextEditingController searchController = TextEditingController();
  String selectedRisk = 'all';
  bool newestFirst = true;

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void onRiskChanged(String risk) {
    setState(() {
      selectedRisk = risk;
    });
  }

  void toggleSortOrder() {
    setState(() {
      newestFirst = !newestFirst;
    });
  }

  void onSearchChanged(String _) {
    setState(() {});
  }

  List<Threat> applyFilters(List<Threat> threats) {
    final query = searchController.text.trim().toLowerCase();
    final filtered = threats.where((threat) {
      if (selectedRisk != 'all' &&
          threat.riskLevel.toLowerCase() != selectedRisk) {
        return false;
      }
      if (query.isEmpty) {
        return true;
      }
      return threat.description.toLowerCase().contains(query) ||
          threat.type.toLowerCase().contains(query) ||
          threat.deviceId.toLowerCase().contains(query) ||
          threat.threatId.toLowerCase().contains(query);
    }).toList();

    filtered.sort((a, b) {
      if (newestFirst) {
        return b.detectedAt.compareTo(a.detectedAt);
      }
      return a.detectedAt.compareTo(b.detectedAt);
    });
    return filtered;
  }
}
