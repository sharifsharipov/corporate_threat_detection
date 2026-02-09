import 'package:corporate_threat_detection/features/settings/data/models/user_profile_model/user_profile_model.dart';
import 'package:equatable/equatable.dart';

class UserManagementState extends Equatable {
  final bool isLoading;
  final List<UserProfileModel> users;
  final String? errorMessage;

  const UserManagementState({
    required this.isLoading,
    required this.users,
    required this.errorMessage,
  });

  factory UserManagementState.initial() => const UserManagementState(
        isLoading: false,
        users: [],
        errorMessage: null,
      );

  UserManagementState copyWith({
    bool? isLoading,
    List<UserProfileModel>? users,
    String? errorMessage,
  }) {
    return UserManagementState(
      isLoading: isLoading ?? this.isLoading,
      users: users ?? this.users,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => <Object?>[isLoading, users, errorMessage];
}
