import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nxcar/core/common_widgets/app_scaffold.dart';
import 'package:nxcar/core/common_widgets/common_appbar.dart';
import 'package:nxcar/core/constants/app_enum.dart';
import 'package:nxcar/core/theme/app_colors.dart';
import 'package:nxcar/core/theme/app_textstyle.dart';
import 'package:nxcar/feature/authentication/controller/authentication_controller.dart';
import 'package:nxcar/feature/authentication/widget/pin_input_widget.dart';
import 'package:pinput/pinput.dart';

class OTPScreen extends GetView<AuthenticationController> {
  OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CommonAppBar(),
      body: Obx(() => Padding(
            padding: EdgeInsets.all(16.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Enter your OTP',
                  style: AppTextStyle.f24w500,
                ),
                SizedBox(
                  height: 4.h,
                ),

                ///Mobile Number
                Text(
                  "${controller.numberCtrl.value.text.substring(0, 2)}******${controller.numberCtrl.value.text.substring(controller.numberCtrl.value.length - 2, controller.numberCtrl.value.length)}",
                  style: AppTextStyle.f16w500.copyWith(
                    color: AppColors.colorGray98,
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),

                ///OTP Input Field
                PinInputWidget(
                  textEditingController: controller.otpCtrl.value,
                ),
                SizedBox(
                  height: 8.h,
                ),

                ///Resend
                Visibility(
                  visible: (!controller.isOTPInvalid.value),
                  child: Text(
                    'Resend',
                    style: AppTextStyle.f14w400.copyWith(
                      color: AppColors.colorCyan9B,
                    ),
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),

                ///Next Button
                SizedBox(
                  width: double.infinity,
                  child: (controller.otpVerificationState.value ==
                          ApiState.loading)

                      ///Used Circular because it is going to be compiled in Android Device
                      ? Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: CircularProgressIndicator(),
                        )
                      : ElevatedButton(
                          onPressed: controller.onOTPSubmitted,
                          child: Text(
                            (!controller.isOTPInvalid.value)
                                ? "Next"
                                : "Resend",
                            style: AppTextStyle.f16w400.copyWith(
                              color: AppColors.colorWhite,
                            ),
                          ),
                        ),
                ),
              ],
            ),
          )),
    );
  }
}
