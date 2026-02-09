import 'dart:async';

import 'package:corporate_threat_detection/core/themes/colors/app_colors.dart';
import 'package:corporate_threat_detection/features/analytics/data/models/report_type_model/report_type_model.dart';
import 'package:corporate_threat_detection/features/analytics/data/models/recent_report_model/recent_report_model.dart';
import 'package:corporate_threat_detection/features/analytics/domain/use_cases/stream_recent_reports_use_case.dart';
import 'package:corporate_threat_detection/features/analytics/domain/use_cases/stream_report_types_use_case.dart';
import 'package:corporate_threat_detection/features/analytics/presentation/bloc/reports_state.dart';
import 'package:corporate_threat_detection/features/analytics/presentation/models/reports_view_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportsCubit extends Cubit<ReportsState> {
  final StreamReportTypesUseCase streamReportTypesUseCase;
  final StreamRecentReportsUseCase streamRecentReportsUseCase;
  StreamSubscription? _typesSub;
  StreamSubscription? _recentSub;

  ReportsCubit({
    required this.streamReportTypesUseCase,
    required this.streamRecentReportsUseCase,
  }) : super(ReportsState.initial());

  void startRealtime() {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    _typesSub?.cancel();
    _recentSub?.cancel();

    _typesSub = streamReportTypesUseCase().listen((result) {
      result.either(
        (failure) => emit(
          state.copyWith(isLoading: false, errorMessage: failure.message),
        ),
        (types) => emit(
          state.copyWith(
            isLoading: false,
            reportTypes: _mapTypes(types),
            errorMessage: null,
          ),
        ),
      );
    }, onError: (Object error) {
      emit(state.copyWith(isLoading: false, errorMessage: error.toString()));
    });

    _recentSub = streamRecentReportsUseCase().listen((result) {
      result.either(
        (failure) => emit(
          state.copyWith(isLoading: false, errorMessage: failure.message),
        ),
        (reports) => emit(
          state.copyWith(
            isLoading: false,
            recentReports: _mapRecent(reports),
            errorMessage: null,
          ),
        ),
      );
    }, onError: (Object error) {
      emit(state.copyWith(isLoading: false, errorMessage: error.toString()));
    });
  }

  List<ReportTypeData> _mapTypes(List<ReportTypeModel> types) {
    if (types.isEmpty) {
      return [
        ReportTypeData(
          icon: Icons.analytics,
          title: 'Analytics Report',
          description: 'In-depth analytics and trend analysis',
          color: AppColors.buttonColor,
          recentCount: 0,
        ),
      ];
    }
    return types
        .map(
          (type) => ReportTypeData(
            icon: IconData(type.iconCodePoint, fontFamily: 'MaterialIcons'),
            title: type.title,
            description: type.description,
            color: Color(type.colorValue),
            recentCount: type.recentCount,
          ),
        )
        .toList();
  }

  List<RecentReportData> _mapRecent(List<RecentReportModel> reports) {
    return reports
        .map(
          (report) => RecentReportData(
            reportName: report.reportName,
            reportType: report.reportType,
            generatedDate: report.generatedDate,
            fileSize: report.fileSize,
            format: report.format,
          ),
        )
        .toList();
  }

  @override
  Future<void> close() {
    _typesSub?.cancel();
    _recentSub?.cancel();
    return super.close();
  }
}
