import 'package:corporate_threat_detection/core/themes/colors/app_colors.dart';
import 'package:flutter/material.dart';

class RecentReportItem extends StatelessWidget {
  final String reportName;
  final String reportType;
  final DateTime generatedDate;
  final String fileSize;
  final String format;
  final VoidCallback onDownload;
  final VoidCallback onView;

  const RecentReportItem({
    super.key,
    required this.reportName,
    required this.reportType,
    required this.generatedDate,
    required this.fileSize,
    required this.format,
    required this.onDownload,
    required this.onView,
  });

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date);

    if (diff.inDays == 0) {
      if (diff.inHours == 0) {
        return '${diff.inMinutes}m ago';
      }
      return '${diff.inHours}h ago';
    } else if (diff.inDays < 7) {
      return '${diff.inDays}d ago';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }

  Color _getFormatColor() {
    switch (format.toUpperCase()) {
      case 'PDF':
        return AppColors.c_F71E52;
      case 'CSV':
        return AppColors.c_03A64B;
      case 'EXCEL':
      case 'XLSX':
        return AppColors.c_03A64B;
      default:
        return AppColors.buttonColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: _getFormatColor().withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Icon(
                  _getFormatIcon(),
                  color: _getFormatColor(),
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      reportName,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 3),
                    Row(
                      children: [
                        Text(
                          reportType,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 6),
                          width: 3,
                          height: 3,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Text(
                          _formatDate(generatedDate),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: _getFormatColor().withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  format.toUpperCase(),
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: _getFormatColor(),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                fileSize,
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
              ),
              const Spacer(),
              TextButton.icon(
                onPressed: onView,
                icon: Icon(Icons.visibility_outlined, size: 16),
                label: const Text('View'),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
              const SizedBox(width: 4),
              IconButton(
                onPressed: onDownload,
                icon: const Icon(Icons.download_outlined),
                iconSize: 20,
                padding: const EdgeInsets.all(8),
                constraints: const BoxConstraints(),
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.buttonColor.withOpacity(0.1),
                  foregroundColor: AppColors.buttonColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  IconData _getFormatIcon() {
    switch (format.toUpperCase()) {
      case 'PDF':
        return Icons.picture_as_pdf;
      case 'CSV':
        return Icons.table_chart;
      case 'EXCEL':
      case 'XLSX':
        return Icons.grid_on;
      default:
        return Icons.insert_drive_file;
    }
  }
}
