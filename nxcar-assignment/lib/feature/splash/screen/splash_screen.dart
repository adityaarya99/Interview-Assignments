import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nxcar/core/asset/app_icons.dart';
import 'package:nxcar/core/common_widgets/app_scaffold.dart';
import 'package:nxcar/core/theme/app_colors.dart';
import 'package:nxcar/core/theme/app_textstyle.dart';
import 'package:nxcar/feature/splash/controller/splash_controller.dart';
import 'package:nxcar/feature/splash/widget/splash_animation.dart';

class SplashScreen extends GetView<SplashController> {
  SplashScreen({super.key});

  final SplashController splashController =
      Get.put<SplashController>(SplashController());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  controller.goBack(controller.currentIndex.value);
                },
                child: SvgPicture.asset(
                  AppIcons.nxCar,
                  width: 101.w,
                  height: 21.h,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),

              ///Animation Widget
              SplashAnimation(),
              SizedBox(
                height: 24.h,
              ),

              ///Splash Title
              Obx(() => Column(
                    children: [
                      SizedBox(
                        width: 343.w,
                        child: Text(
                          SplashController.splashTitles[
                              (controller.currentIndex.value <= 2)
                                  ? controller.currentIndex.value
                                  : 2],
                          style: AppTextStyle.f28w600.copyWith(
                              color: AppColors.colorBlack24,
                              fontFamily: 'Inter'),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(right: 16.0.w, left: 16.0.w, bottom: 24.0).w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ///Dots Indicator
            Obx(() => DotsIndicator(
                  dotsCount: SplashController.splashTitles.length,
                  position: (controller.currentIndex.value <= 2)
                      ? controller.currentIndex.value
                      : 2,
                  decorator: DotsDecorator(
                    color: AppColors.colorGrayD9,
                    activeColor: AppColors.colorCyanC1,
                    size: Size.square(12.0.w),
                    activeSize: Size(40.0.w, 12.0.h),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0).w),
                  ),
                )),

            ///Updates Page Index
            GestureDetector(
              onTap: () {
                (controller.isButtonDisabled.value)
                    ? () {}
                    : controller
                        .arrowForwardOnTap(controller.currentIndex.value);
              },
              child: CircleAvatar(
                radius: 32.r,
                backgroundColor: AppColors.colorCyan,
                child: SvgPicture.asset(
                  AppIcons.arrowForward,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
