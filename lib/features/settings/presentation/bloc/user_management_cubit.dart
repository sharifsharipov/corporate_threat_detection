import 'dart:async';

import 'package:corporate_threat_detection/features/settings/data/models/user_profile_model/user_profile_model.dart';
import 'package:corporate_threat_detection/features/settings/domain/use_cases/stream_user_profiles_use_case.dart';
import 'package:corporate_threat_detection/features/settings/domain/use_cases/update_user_profile_use_case.dart';
import 'package:corporate_threat_detection/features/settings/presentation/bloc/user_management_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserManagementCubit extends Cubit<UserManagementState> {
  final StreamUserProfilesUseCase streamUserProfilesUseCase;
  final UpdateUserProfileUseCase updateUserProfileUseCase;
  StreamSubscription? _subscription;

  UserManagementCubit({
    required this.streamUserProfilesUseCase,
    required this.updateUserProfileUseCase,
  }) : super(UserManagementState.initial());

  void startRealtime({int limit = 200}) {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    _subscription?.cancel();
    _subscription = streamUserProfilesUseCase(limit: limit).listen(
      (result) {
        result.either(
          (failure) => emit(
            state.copyWith(isLoading: false, errorMessage: failure.message),
          ),
          (users) => emit(
            state.copyWith(
              isLoading: false,
              users: users.isNotEmpty ? users : _mockUsers,
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

  Future<void> updateRole(UserProfileModel user, UserRole role) async {
    // Optimistic update
    final updatedUsers = state.users.map((u) {
      if (u.uid == user.uid) return u.copyWith(role: role);
      return u;
    }).toList();
    emit(state.copyWith(users: updatedUsers));

    final result = await updateUserProfileUseCase(
      UpdateUserProfileParams(
        uid: user.uid,
        data: <String, dynamic>{'role': role.name},
      ),
    );
    result.either(
      (failure) => emit(state.copyWith(errorMessage: failure.message)),
      (_) => null,
    );
  }

  Future<void> toggleActive(UserProfileModel user, bool isActive) async {
    // Optimistic update
    final updatedUsers = state.users.map((u) {
      if (u.uid == user.uid) return u.copyWith(isActive: isActive);
      return u;
    }).toList();
    emit(state.copyWith(users: updatedUsers));

    final result = await updateUserProfileUseCase(
      UpdateUserProfileParams(
        uid: user.uid,
        data: <String, dynamic>{'isActive': isActive},
      ),
    );
    result.either(
      (failure) => emit(state.copyWith(errorMessage: failure.message)),
      (_) => null,
    );
  }

  static final List<UserProfileModel> _mockUsers = [
    const UserProfileModel(
      uid: 'user-1',
      email: 'admin@company.com',
      displayName: 'System Admin',
      photoUrl: null,
      role: UserRole.admin,
      isActive: true,
    ),
    const UserProfileModel(
      uid: 'user-2',
      email: 'analyst1@company.com',
      displayName: 'John Doe',
      photoUrl: null,
      role: UserRole.analyst,
      isActive: true,
    ),
    const UserProfileModel(
      uid: 'user-3',
      email: 'viewer@company.com',
      displayName: 'Jane Smith',
      photoUrl: null,
      role: UserRole.viewer,
      isActive: false,
    ),
  ];

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
