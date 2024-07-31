import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nxcar/core/asset/app_icons.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final VoidCallback? leadingOnTap;
  const CommonAppBar({
    super.key,
    this.leading,
    this.leadingOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0.0,
      leading: leading ??
          GestureDetector(
            onTap: leadingOnTap ??
                () {
                  Get.back();
                },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SvgPicture.asset(
                AppIcons.arrowBack,
                width: 24.w,
                height: 24.h,
              ),
            ),
          ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight.h);
}
