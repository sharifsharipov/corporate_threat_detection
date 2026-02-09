import 'package:corporate_threat_detection/features/logs/data/models/traffic_log/traffic_log.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TrafficLogItem extends StatelessWidget {
  final TrafficLog log;

  const TrafficLogItem({super.key, required this.log});

  @override
  Widget build(BuildContext context) {
    final timestamp = DateFormat('yyyy-MM-dd HH:mm:ss').format(log.timestamp);
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${log.sourceIp} → ${log.destinationIp}',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '${log.protocol.toUpperCase()} : ${log.port} • ${log.packetSize} bytes',
            style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
          ),
          const SizedBox(height: 4),
          Text(
            'Device: ${log.deviceId} • $timestamp',
            style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
          ),
          if (log.apiUsed != null && log.apiUsed!.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(
              'API: ${log.apiUsed}',
              style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
            ),
          ],
        ],
      ),
    );
  }
}
