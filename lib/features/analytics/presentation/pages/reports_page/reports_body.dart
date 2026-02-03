import 'package:corporate_threat_detection/core/themes/colors/app_colors.dart';
import 'package:corporate_threat_detection/features/analytics/presentation/pages/reports_page/reports_mixin.dart';
import 'package:corporate_threat_detection/features/analytics/presentation/pages/reports_page/widgets/generate_report_dialog.dart';
import 'package:corporate_threat_detection/features/analytics/presentation/pages/reports_page/widgets/recent_report_item.dart';
import 'package:corporate_threat_detection/features/analytics/presentation/pages/reports_page/widgets/report_type_card.dart';
import 'package:flutter/material.dart';

class ReportsBody extends StatelessWidget {
  final ReportsMixin mixin;

  const ReportsBody({super.key, required this.mixin});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.c_f0f2f4,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with Generate Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Report Types',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () => _showGenerateDialog(context),
                  icon: const Icon(Icons.add, size: 18),
                  label: const Text('New Report'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttonColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Report Types Grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.85,
              ),
              itemCount: mixin.reportTypes.length,
              itemBuilder: (context, index) {
                final reportType = mixin.reportTypes[index];
                return ReportTypeCard(
                  icon: reportType.icon,
                  title: reportType.title,
                  description: reportType.description,
                  color: reportType.color,
                  recentCount: reportType.recentCount,
                  onGenerate: () => _showGenerateDialog(
                    context,
                    initialType: reportType.title,
                  ),
                );
              },
            ),
            const SizedBox(height: 24),

            // Recent Reports Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Recent Reports',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Navigate to all reports
                  },
                  child: const Text('View All'),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Recent Reports List
            ...mixin.recentReports.map((report) {
              return RecentReportItem(
                reportName: report.reportName,
                reportType: report.reportType,
                generatedDate: report.generatedDate,
                fileSize: report.fileSize,
                format: report.format,
                onDownload: () => mixin.handleDownloadReport(report.reportName),
                onView: () => mixin.handleViewReport(report.reportName),
              );
            }),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _showGenerateDialog(BuildContext context, {String? initialType}) {
    showDialog(
      context: context,
      builder: (context) => const GenerateReportDialog(),
    ).then((result) {
      if (result != null) {
        // Handle report generation
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Generating ${result['type']} as ${result['format']}...',
            ),
            backgroundColor: AppColors.c_03A64B,
          ),
        );
      }
    });
  }
}
