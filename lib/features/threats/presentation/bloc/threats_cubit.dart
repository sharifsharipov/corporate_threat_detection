import 'dart:async';

import 'package:corporate_threat_detection/core/usecase/usecase.dart';
import 'package:corporate_threat_detection/features/threats/data/models/threat/threat.dart';
import 'package:corporate_threat_detection/features/threats/domain/use_cases/get_threat_by_id_use_case.dart';
import 'package:corporate_threat_detection/features/threats/domain/use_cases/get_threats_use_case.dart';
import 'package:corporate_threat_detection/features/threats/domain/use_cases/stream_threats_use_case.dart';
import 'package:corporate_threat_detection/features/threats/domain/use_cases/stream_threats_by_status_use_case.dart';
import 'package:corporate_threat_detection/features/threats/domain/use_cases/update_threat_status_use_case.dart';
import 'package:corporate_threat_detection/features/threats/presentation/bloc/threats_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThreatsCubit extends Cubit<ThreatsState> {
  final GetThreatsUseCase getThreatsUseCase;
  final GetThreatByIdUseCase getThreatByIdUseCase;
  final StreamThreatsUseCase streamThreatsUseCase;
  final StreamThreatsByStatusUseCase streamThreatsByStatusUseCase;
  final UpdateThreatStatusUseCase updateThreatStatusUseCase;
  StreamSubscription? _threatsSubscription;

  ThreatsCubit({
    required this.getThreatsUseCase,
    required this.getThreatByIdUseCase,
    required this.streamThreatsUseCase,
    required this.streamThreatsByStatusUseCase,
    required this.updateThreatStatusUseCase,
  }) : super(ThreatsState.initial());

  Future<void> fetchThreats() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final result = await getThreatsUseCase(NoParams());
    result.either(
      (failure) =>
          emit(state.copyWith(isLoading: false, errorMessage: failure.message)),
      (threats) => emit(
        state.copyWith(
          isLoading: false,
          threats: threats.isNotEmpty ? threats : _mockThreats,
          errorMessage: null,
        ),
      ),
    );
  }

  void startRealtime() {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    _threatsSubscription?.cancel();
    _threatsSubscription = streamThreatsUseCase(NoParams()).listen(
      (result) {
        result.either(
          (failure) => emit(
            state.copyWith(isLoading: false, errorMessage: failure.message),
          ),
          (threats) => emit(
            state.copyWith(
              isLoading: false,
              threats: threats.isNotEmpty ? threats : _mockThreats,
              errorMessage: null,
            ),
          ),
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
      description: 'Multiple failed SSH attempts detected from 192.168.1.105',
      detectionMethod: 'Signature-based',
      detectedAt: DateTime.now().subtract(const Duration(minutes: 5)),
    ),
    Threat(
      threatId: 'T-2',
      deviceId: 'WS-CORP-04',
      type: 'Malware',
      riskLevel: 'critical',
      status: 'active',
      description:
          'Trojan.BitRAT signature detected in memory of Workstation-04',
      detectionMethod: 'Heuristic',
      detectedAt: DateTime.now().subtract(const Duration(minutes: 20)),
    ),
    Threat(
      threatId: 'T-3',
      deviceId: 'SRV-DATA-SEC',
      type: 'Data',
      riskLevel: 'high',
      status: 'resolved',
      description: 'Anomalous outbound traffic (4GB) to unknown external IP',
      detectionMethod: 'Anomaly Detection',
      detectedAt: DateTime.now().subtract(const Duration(hours: 1)),
    ),
    Threat(
      threatId: 'T-4',
      deviceId: 'GATEWAY-PUB',
      type: 'Web',
      riskLevel: 'medium',
      status: 'new',
      description: 'Web Application Firewall blocked SQL injection payload',
      detectionMethod: 'Rule-based',
      detectedAt: DateTime.now().subtract(const Duration(hours: 3)),
    ),
  ];

  void startRealtimeByStatus(String status) {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    _threatsSubscription?.cancel();
    _threatsSubscription =
        streamThreatsByStatusUseCase(
          StreamThreatsByStatusParams(status: status),
        ).listen(
          (result) {
            result.either(
              (failure) => emit(
                state.copyWith(isLoading: false, errorMessage: failure.message),
              ),
              (threats) => emit(
                state.copyWith(
                  isLoading: false,
                  threats: threats,
                  errorMessage: null,
                ),
              ),
            );
          },
          onError: (Object error) {
            emit(
              state.copyWith(isLoading: false, errorMessage: error.toString()),
            );
          },
        );
  }

  Future<void> fetchThreatById(String id) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final result = await getThreatByIdUseCase(GetThreatByIdParams(id: id));
    result.either(
      (failure) =>
          emit(state.copyWith(isLoading: false, errorMessage: failure.message)),
      (threat) => emit(
        state.copyWith(
          isLoading: false,
          selectedThreat: threat,
          errorMessage: null,
        ),
      ),
    );
  }

  Future<void> updateThreatStatus(String id, String status) async {
    emit(state.copyWith(isUpdating: true, errorMessage: null));
    final result = await updateThreatStatusUseCase(
      UpdateThreatStatusParams(id: id, status: status),
    );
    result.either(
      (failure) => emit(
        state.copyWith(isUpdating: false, errorMessage: failure.message),
      ),
      (_) {
        final updatedThreats = state.threats
            .map(
              (threat) => threat.threatId == id
                  ? threat.copyWith(status: status)
                  : threat,
            )
            .toList();
        final selected = state.selectedThreat?.threatId == id
            ? state.selectedThreat?.copyWith(status: status)
            : state.selectedThreat;
        emit(
          state.copyWith(
            isUpdating: false,
            threats: updatedThreats,
            selectedThreat: selected,
            errorMessage: null,
          ),
        );
      },
    );
  }

  List<Threat> filterByStatus(String status) => state.threats
      .where((threat) => threat.status.toLowerCase() == status.toLowerCase())
      .toList();

  @override
  Future<void> close() {
    _threatsSubscription?.cancel();
    return super.close();
  }
}
