import 'package:corporate_threat_detection/core/themes/colors/app_colors.dart';
import 'package:flutter/material.dart';

enum SettingsTileType { navigation, switchType, info }

class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final SettingsTileType type;
  final bool? switchValue;
  final Function(bool)? onSwitchChanged;
  final VoidCallback? onTap;
  final String? infoValue;
  final Color? iconColor;

  const SettingsTile({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    required this.type,
    this.switchValue,
    this.onSwitchChanged,
    this.onTap,
    this.infoValue,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: type == SettingsTileType.switchType ? null : onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: (iconColor ?? Colors.grey.shade600).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  size: 20,
                  color: iconColor ?? Colors.grey.shade600,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    if (subtitle != null) ...[
                      const SizedBox(height: 2),
                      Text(
                        subtitle!,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(width: 8),
              _buildTrailing(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTrailing() {
    switch (type) {
      case SettingsTileType.navigation:
        return Icon(Icons.chevron_right, color: Colors.grey.shade400);
      case SettingsTileType.switchType:
        return Switch.adaptive(
          value: switchValue ?? false,
          onChanged: onSwitchChanged,
          activeColor: AppColors.buttonColor,
        );
      case SettingsTileType.info:
        return Text(
          infoValue ?? '',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade600,
          ),
        );
    }
  }
}
