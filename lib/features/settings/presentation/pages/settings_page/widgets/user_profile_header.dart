import 'package:corporate_threat_detection/core/themes/colors/app_colors.dart';
import 'package:flutter/material.dart';

class UserProfileHeader extends StatelessWidget {
  final String name;
  final String email;
  final String role;
  final String avatarUrl;
  final VoidCallback onEditProfile;

  const UserProfileHeader({
    super.key,
    required this.name,
    required this.email,
    required this.role,
    required this.avatarUrl,
    required this.onEditProfile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: Row(
        children: [
          CircleAvatar(
            radius: 36,
            backgroundColor: AppColors.buttonColor.withOpacity(0.1),
            backgroundImage: avatarUrl.isNotEmpty
                ? NetworkImage(avatarUrl)
                : null,
            child: avatarUrl.isEmpty
                ? Text(
                    name.isNotEmpty ? name.substring(0, 1).toUpperCase() : 'U',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppColors.buttonColor,
                    ),
                  )
                : null,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  email,
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                ),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.buttonColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    role,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.buttonColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onEditProfile,
            icon: const Icon(Icons.edit_outlined),
            color: Colors.grey.shade600,
            tooltip: 'Edit Profile',
          ),
        ],
      ),
    );
  }
}
