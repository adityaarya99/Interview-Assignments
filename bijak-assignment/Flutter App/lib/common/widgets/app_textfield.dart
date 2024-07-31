import 'package:bijakassignment/common/theme/app_colors.dart';
import 'package:bijakassignment/common/theme/app_textstyle.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextStyle? hintStyle;
  final String? hintText;
  final Widget? prefix;
  final Widget? suffix;
  const AppTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        fillColor: AppColors.colorWhite,
        prefixIcon: prefix,
        suffixIcon: suffix,
        hintText: hintText,
        hintStyle: hintStyle ??
            AppTextStyle.f14w400.copyWith(
              color: AppColors.colorGrey,
            ),
      ),
    );
  }
}
