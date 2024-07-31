import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nxcar/core/asset/app_icons.dart';
import 'package:nxcar/core/constants/app_enum.dart';
import 'package:nxcar/feature/splash/controller/splash_controller.dart';

class SplashAnimation extends GetView<SplashController> {
  const SplashAnimation({super.key});

  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              SvgPicture.asset(
                AppIcons.ellipse,
              ),

              ///ICON-1
              AnimatedPositioned(
                child: SvgPicture.asset(
                  AppIcons.splashIcon2,
                ),
                top: () {
                  switch (controller.positionState.value) {
                    case PositionState.initial:
                      return 0.h;
                    case PositionState.second:
                      return 0.h;
                    case PositionState.third:
                      return 0.h;
                    case PositionState.fourth:
                      return 0.h;
                    case PositionState.fifth:
                      return 70.h;
                  }
                }(),
                right: () {
                  switch (controller.positionState.value) {
                    case PositionState.initial:
                      return 10.w;
                    case PositionState.second:
                      return 10.w;
                    case PositionState.third:
                      return 10.w;
                    case PositionState.fourth:
                      return 10.w;
                    case PositionState.fifth:
                      return 220.w;
                  }
                }(),
                duration: Duration(seconds: 1),
              ),

              ///ICON-2
              AnimatedPositioned(
                child: SvgPicture.asset(
                  AppIcons.splashIcon1,
                ),
                top: () {
                  switch (controller.positionState.value) {
                    case PositionState.initial:
                      return 90.h;
                    case PositionState.second:
                      return 220.h;
                    case PositionState.third:
                      return 350.h;
                    case PositionState.fourth:
                      return 410.h;
                    case PositionState.fifth:
                      return 0.h;
                  }
                }(),
                left: () {
                  switch (controller.positionState.value) {
                    case PositionState.initial:
                      return 1.w;
                    case PositionState.second:
                      return 120.w;
                    case PositionState.third:
                      return 1.w;
                    case PositionState.fourth:
                      return 220.w;
                    case PositionState.fifth:
                      return 220.w;
                  }
                }(),
                duration: Duration(seconds: 1),
              ),

              ///ICON-3
              AnimatedPositioned(
                child: SvgPicture.asset(
                  AppIcons.splashIcon4,
                ),
                top: () {
                  switch (controller.positionState.value) {
                    case PositionState.initial:
                      return 200.h;
                    case PositionState.second:
                      return 80.h;
                    case PositionState.third:
                      return 80.h;
                    case PositionState.fourth:
                      return 80.h;
                    case PositionState.fifth:
                      return 350.h;
                  }
                }(),
                left: () {
                  switch (controller.positionState.value) {
                    case PositionState.initial:
                      return 130.w;
                    case PositionState.second:
                      return 1.w;
                    case PositionState.third:
                      return 1.w;
                    case PositionState.fourth:
                      return 1.w;
                    case PositionState.fifth:
                      return 1.w;
                  }
                }(),
                duration: Duration(seconds: 1),
              ),

              ///ICON-4
              AnimatedPositioned(
                child: SvgPicture.asset(
                  AppIcons.splashIcon5,
                ),
                top: () {
                  switch (controller.positionState.value) {
                    case PositionState.initial:
                      return 350.h;
                    case PositionState.second:
                      return 350.h;
                    case PositionState.third:
                      return 220.h;
                    case PositionState.fourth:
                      return 350.h;
                    case PositionState.fifth:
                      return 380.h;
                  }
                }(),
                left: () {
                  switch (controller.positionState.value) {
                    case PositionState.initial:
                      return 1.w;
                    case PositionState.second:
                      return 1.w;
                    case PositionState.third:
                      return 120.w;
                    case PositionState.fourth:
                      return 1.w;
                    case PositionState.fifth:
                      return 220.w;
                  }
                }(),
                duration: Duration(seconds: 1),
              ),

              ///ICON-5
              AnimatedPositioned(
                child: SvgPicture.asset(
                  AppIcons.splashIcon3,
                ),
                top: () {
                  switch (controller.positionState.value) {
                    case PositionState.initial:
                      return 400.h;
                    case PositionState.second:
                      return 400.h;
                    case PositionState.third:
                      return 400.h;
                    case PositionState.fourth:
                      return 200.h;
                    case PositionState.fifth:
                      return 200.h;
                  }
                }(),
                right: () {
                  switch (controller.positionState.value) {
                    case PositionState.initial:
                      return 1.w;
                    case PositionState.second:
                      return 1.w;
                    case PositionState.third:
                      return 1.w;
                    case PositionState.fourth:
                      return 85.w;
                    case PositionState.fifth:
                      return 85.w;
                  }
                }(),
                duration: Duration(seconds: 1),
              ),
            ],
          ),
        ],
      );
    });
  }
}
