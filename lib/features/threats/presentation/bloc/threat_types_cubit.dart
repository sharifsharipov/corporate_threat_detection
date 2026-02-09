import 'dart:async';

import 'package:corporate_threat_detection/features/threats/data/models/threat/threat.dart';
import 'package:corporate_threat_detection/features/threats/domain/use_cases/stream_threats_use_case.dart';
import 'package:corporate_threat_detection/features/threats/presentation/bloc/threat_types_state.dart';
import 'package:corporate_threat_detection/core/usecase/usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThreatTypesCubit extends Cubit<ThreatTypesState> {
  final StreamThreatsUseCase streamThreatsUseCase;
  StreamSubscription? _subscription;

  ThreatTypesCubit({required this.streamThreatsUseCase})
    : super(ThreatTypesState.initial());

  void startRealtime() {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    _subscription?.cancel();
    _subscription = streamThreatsUseCase(NoParams()).listen(
      (result) {
        result.either(
          (failure) => emit(
            state.copyWith(isLoading: false, errorMessage: failure.message),
          ),
          (threats) {
            final summaries = _buildSummaries(
              threats.isNotEmpty ? threats : _mockThreats,
            );
            emit(
              state.copyWith(
                isLoading: false,
                summaries: summaries,
                errorMessage: null,
              ),
            );
          },
        );
      },
      onError: (Object error) {
        emit(state.copyWith(isLoading: false, errorMessage: error.toString()));
      },
    );
  }

  static final List<Threat> _mockThreats = [
    Threat(
      threatId: 'T-1',
      deviceId: 'SRV-AUTH-01',
      type: 'Authentication',
      riskLevel: 'high',
      status: 'new',
      description: 'Multiple failed SSH attempts',
      detectionMethod: 'Signature',
      detectedAt: DateTime.now(),
    ),
    Threat(
      threatId: 'T-2',
      deviceId: 'WS-04',
      type: 'Malware',
      riskLevel: 'critical',
      status: 'active',
      description: 'Trojan detected',
      detectionMethod: 'Heuristic',
      detectedAt: DateTime.now(),
    ),
    Threat(
      threatId: 'T-3',
      deviceId: 'SRV-01',
      type: 'Data Exfiltration',
      riskLevel: 'high',
      status: 'resolved',
      description: 'Anomalous traffic',
      detectionMethod: 'Anomaly',
      detectedAt: DateTime.now(),
    ),
  ];

  List<ThreatTypeSummary> _buildSummaries(List<Threat> threats) {
    final Map<String, ThreatTypeSummary> summaryMap = {};
    for (final threat in threats) {
      final type = threat.type.isNotEmpty ? threat.type : 'Unknown';
      final risk = threat.riskLevel.toLowerCase();
      final existing = summaryMap[type];
      if (existing == null) {
        summaryMap[type] = ThreatTypeSummary(
          type: type,
          total: 1,
          critical: risk == 'critical' ? 1 : 0,
          high: risk == 'high' ? 1 : 0,
          medium: risk == 'medium' ? 1 : 0,
          low: risk == 'low' ? 1 : 0,
        );
      } else {
        summaryMap[type] = ThreatTypeSummary(
          type: type,
          total: existing.total + 1,
          critical: existing.critical + (risk == 'critical' ? 1 : 0),
          high: existing.high + (risk == 'high' ? 1 : 0),
          medium: existing.medium + (risk == 'medium' ? 1 : 0),
          low: existing.low + (risk == 'low' ? 1 : 0),
        );
      }
    }
    final summaries = summaryMap.values.toList()
      ..sort((a, b) => b.total.compareTo(a.total));
    return summaries;
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
