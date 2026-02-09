import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:corporate_threat_detection/features/analytics/data/data_source/reports_data_source.dart';
import 'package:corporate_threat_detection/features/analytics/data/models/report_type_model/report_type_model.dart';
import 'package:corporate_threat_detection/features/analytics/data/models/recent_report_model/recent_report_model.dart';

class ReportsDataSourceImpl implements ReportsDataSource {
  final FirebaseFirestore firestore;

  ReportsDataSourceImpl({required this.firestore});

  Map<String, dynamic> _normalizeReportTypeData(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = Map<String, dynamic>.from(doc.data() ?? {});
    data.putIfAbsent('title', () => doc.id);
    data.putIfAbsent('description', () => '');
    data.putIfAbsent('iconCodePoint', () => 0xe86f);
    data.putIfAbsent('colorValue', () => 0xFF3B82F6);
    data.putIfAbsent('recentCount', () => 0);
    return data;
  }

  Map<String, dynamic> _normalizeRecentReportData(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = Map<String, dynamic>.from(doc.data() ?? {});
    data.putIfAbsent('reportName', () => doc.id);
    data.putIfAbsent('reportType', () => '');
    data.putIfAbsent('fileSize', () => '');
    data.putIfAbsent('format', () => 'PDF');
    final generatedDate = data['generatedDate'];
    if (generatedDate is Timestamp) {
      data['generatedDate'] = generatedDate.toDate().toIso8601String();
    } else if (generatedDate is DateTime) {
      data['generatedDate'] = generatedDate.toIso8601String();
    }
    return data;
  }

  @override
  Stream<List<ReportTypeModel>> streamReportTypes() {
    return firestore.collection('report_types').snapshots().map(
          (snapshot) => snapshot.docs
              .map(
                (doc) => ReportTypeModel.fromJson(
                  _normalizeReportTypeData(doc),
                ),
              )
              .toList(),
        );
  }

  @override
  Stream<List<RecentReportModel>> streamRecentReports() {
    return firestore.collection('recent_reports').snapshots().map(
          (snapshot) => snapshot.docs
              .map(
                (doc) => RecentReportModel.fromJson(
                  _normalizeRecentReportData(doc),
                ),
              )
              .toList(),
        );
  }
}
