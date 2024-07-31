import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nxcar/core/theme/app_colors.dart';
import 'package:nxcar/core/theme/app_textstyle.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'NotoSans',

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        ///backgroundColor:
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (states) => AppColors.colorCyan,
        ),

        ///shape:
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
          return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
            8.0.sp,
          ));
        }),
      ),
    ),

    ///TextField Decorations
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          color: AppColors.colorGray78,
          width: 0.2,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          color: AppColors.colorGray78,
          width: 0.2,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          color: AppColors.colorGray78,
          width: 0.2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          color: AppColors.colorRed,
          width: 0.2,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          color: AppColors.colorCyanFA,
          width: 0.2,
        ),
      ),
      labelStyle: AppTextStyle.f16w500.copyWith(
        color: AppColors.colorBlack5A,
      ),
      errorStyle: AppTextStyle.f14w400.copyWith(
        color: AppColors.colorRed,
      ),

    ),
  );
}
