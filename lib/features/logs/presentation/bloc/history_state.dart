import 'package:corporate_threat_detection/features/logs/data/models/history_event_model/history_event_model.dart';
import 'package:equatable/equatable.dart';

class HistoryState extends Equatable {
  final bool isLoading;
  final List<HistoryEventModel> events;
  final EventSeverity? selectedSeverity;
  final String searchQuery;
  final String? errorMessage;

  const HistoryState({
    required this.isLoading,
    required this.events,
    required this.selectedSeverity,
    required this.searchQuery,
    required this.errorMessage,
  });

  factory HistoryState.initial() => const HistoryState(
    isLoading: false,
    events: [],
    selectedSeverity: null,
    searchQuery: '',
    errorMessage: null,
  );

  HistoryState copyWith({
    bool? isLoading,
    List<HistoryEventModel>? events,
    Object? selectedSeverity = _unset,
    String? searchQuery,
    String? errorMessage,
  }) {
    return HistoryState(
      isLoading: isLoading ?? this.isLoading,
      events: events ?? this.events,
      selectedSeverity: selectedSeverity == _unset
          ? this.selectedSeverity
          : selectedSeverity as EventSeverity?,
      searchQuery: searchQuery ?? this.searchQuery,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => <Object?>[
    isLoading,
    events,
    selectedSeverity,
    searchQuery,
    errorMessage,
  ];
}

const Object _unset = Object();
