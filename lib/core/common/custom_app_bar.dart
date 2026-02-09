import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:corporate_threat_detection/core/extension/extension.dart';
import 'package:corporate_threat_detection/core/utils/utils.dart';
import 'package:corporate_threat_detection/router/routes.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title = "",
    this.centerTitle = true,
    this.actions,
    this.leadingVisible = true,
    this.customLeading = true,
    this.bottom,
    this.onTap,
  });

  final String title;
  final bool centerTitle;
  final Widget? actions;
  final bool leadingVisible;
  final bool customLeading;
  final PreferredSizeWidget? bottom;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.black),
      leading: leadingVisible
          ? (customLeading
                ? IconButton(
                    onPressed: () {
                      onTap?.call();
                      if (context.canPop()) {
                        context.pop();
                      } else {
                        context.go(Routes.dashboardOverview);
                      }
                    },
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                  )
                : null)
          : const SizedBox.shrink(),
      automaticallyImplyLeading: !customLeading && leadingVisible,
      centerTitle: centerTitle,
      title: Text(
        title,
        style: context.textStyle.appBarTitle,
        maxLines: 10,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
      ),
      actions: actions != null ? [actions!.paddingOnly(right: wi(20))] : [],
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(65 + (bottom?.preferredSize.height ?? 0));
}
