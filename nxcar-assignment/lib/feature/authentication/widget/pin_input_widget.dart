import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nxcar/core/theme/app_colors.dart';
import 'package:nxcar/feature/authentication/controller/authentication_controller.dart';
import 'package:pinput/pinput.dart';

class PinInputWidget extends GetView<AuthenticationController> {
  final TextEditingController textEditingController;
  const PinInputWidget({
    super.key,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return Pinput(
      controller: textEditingController,
      length: 4,
      separatorBuilder: (context) => SizedBox(
        width: 16.w,
      ),
      onChanged: (value) {
        if (value.length < 4) {
          controller.isOTPInvalid.value = false;
        } else if (value.length == 4 && value == "0000") {
          controller.onOTPSubmitted();
        }
      },
      validator: (value) {
        if (value != "0000") {
          controller.isOTPInvalid.value = true;
          return "Invalid OTP!";
        }
        return null;
      },
      defaultPinTheme: PinTheme(
        width: 48.w,
        height: 48.h,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.colorGray78,
          ),
          borderRadius: BorderRadius.all(Radius.circular(4.0).w),
        ),
      ),
    );
  }
}
