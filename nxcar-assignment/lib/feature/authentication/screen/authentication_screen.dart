import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nxcar/core/asset/app_icons.dart';
import 'package:nxcar/core/common_widgets/app_scaffold.dart';
import 'package:nxcar/core/common_widgets/app_textfield.dart';
import 'package:nxcar/core/common_widgets/common_appbar.dart';
import 'package:nxcar/core/constants/app_enum.dart';
import 'package:nxcar/core/theme/app_colors.dart';
import 'package:nxcar/core/theme/app_textstyle.dart';
import 'package:nxcar/core/validators/app_validators.dart';
import 'package:nxcar/feature/authentication/controller/authentication_controller.dart';
import 'package:nxcar/feature/authentication/model/signup/signup_request_model.dart';

class AuthenticationScreen extends StatelessWidget {
  AuthenticationScreen({super.key});

  final AuthenticationController authenticationController =
      Get.put<AuthenticationController>(AuthenticationController());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      resizeToAvoidBottomInset: true,
      appBar: CommonAppBar(),
      body: Obx(
        () => SingleChildScrollView(
          child: Form(
            key: authenticationController.formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0).w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome back!",
                    style: AppTextStyle.f24w400.copyWith(
                      color: AppColors.colorBlack4C,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    "Please fill out the details",
                    style: AppTextStyle.f16w500.copyWith(
                      color: AppColors.colorBlack5A,
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),

                  ///Number Text-Field
                  AppTextField(
                    controller: authenticationController.numberCtrl.value,
                    keyboardType: TextInputType.phone,
                    validator: (value) =>
                        AppValidators.validateMobile(value: value ?? ""),
                    label: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: 'Enter your number'),
                          TextSpan(
                              text: ' *',
                              style: AppTextStyle.f16w500.copyWith(
                                color: AppColors.colorRed1C,
                              )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),

                  ///Name Text-Field
                  AppTextField(
                    controller: authenticationController.nameCtrl.value,
                    validator: (value) => AppValidators.validateEmpty(
                        value: value ?? "", message: "Name cannot be empty"),
                    label: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: 'Enter your name'),
                          TextSpan(
                              text: ' *',
                              style: AppTextStyle.f16w500.copyWith(
                                color: AppColors.colorRed1C,
                              )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),

                  ///Email Text-Field
                  AppTextField(
                    controller: authenticationController.emailCtrl.value,
                    validator: (value) =>
                        AppValidators.validateEmail(email: value ?? ""),
                    label: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: 'Enter your email'),
                          TextSpan(
                              text: ' *',
                              style: AppTextStyle.f16w500.copyWith(
                                color: AppColors.colorRed1C,
                              )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),

                  ///Vehicle Number Text-Field
                  AppTextField(
                    controller:
                        authenticationController.vehicleNumberCtrl.value,
                    validator: (value) => AppValidators.validateVehicleNumber(
                        vehicleNumber: value ?? ""),
                    label: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: 'Enter your vehicle number'),
                          TextSpan(
                              text: ' *',
                              style: AppTextStyle.f16w500.copyWith(
                                color: AppColors.colorRed1C,
                              )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),

                  ///Next Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        authenticationController.onDetailsFilled();
                      },
                      child: (authenticationController.signUpState.value ==
                              ApiState.loading)
                      ///Used Circular because it is going to be compiled in Android Device
                          ? Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: CircularProgressIndicator(),
                          )
                          : Text(
                              'Next',
                              style: AppTextStyle.f16w400.copyWith(
                                color: AppColors.colorWhite,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
