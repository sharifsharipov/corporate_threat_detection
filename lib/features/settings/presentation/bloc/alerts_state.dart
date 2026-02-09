import 'package:corporate_threat_detection/features/settings/data/models/alert_item_model/alert_item_model.dart';
import 'package:corporate_threat_detection/features/settings/presentation/pages/alerts_page/widgets/alert_filter_tabs.dart';
import 'package:equatable/equatable.dart';

class AlertsState extends Equatable {
  final bool isLoading;
  final List<AlertItemModel> alerts;
  final AlertFilter selectedFilter;
  final String? errorMessage;

  const AlertsState({
    required this.isLoading,
    required this.alerts,
    required this.selectedFilter,
    required this.errorMessage,
  });

  factory AlertsState.initial() => const AlertsState(
    isLoading: false,
    alerts: [],
    selectedFilter: AlertFilter.all,
    errorMessage: null,
  );

  AlertsState copyWith({
    bool? isLoading,
    List<AlertItemModel>? alerts,
    AlertFilter? selectedFilter,
    String? errorMessage,
  }) {
    return AlertsState(
      isLoading: isLoading ?? this.isLoading,
      alerts: alerts ?? this.alerts,
      selectedFilter: selectedFilter ?? this.selectedFilter,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => <Object?>[
    isLoading,
    alerts,
    selectedFilter,
    errorMessage,
  ];
}
