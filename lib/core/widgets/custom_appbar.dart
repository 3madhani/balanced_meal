import 'package:balanced_meal/core/constants/app_sizes.dart';
import 'package:balanced_meal/core/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;

  final bool showBackArrow;
  final VoidCallback? onLeadingPressed;
  const CustomAppbar({
    super.key,
    this.title,
    this.showBackArrow = false,
    this.onLeadingPressed,
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: Colors.black,
      centerTitle: true,
      backgroundColor: AppColors.appbarColor,
      automaticallyImplyLeading: false,
      leading: showBackArrow
          ? Padding(
              padding: const EdgeInsets.only(left: AppSizes.defaultPadding),
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  CupertinoIcons.chevron_back,
                  size: 20,
                ),
              ),
            )
          : null,
      title: title,
    );
  }
}
