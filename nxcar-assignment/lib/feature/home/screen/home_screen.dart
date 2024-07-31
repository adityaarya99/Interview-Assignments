import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nxcar/core/asset/app_icons.dart';
import 'package:nxcar/core/common_widgets/app_scaffold.dart';
import 'package:nxcar/core/common_widgets/common_appbar.dart';
import 'package:nxcar/core/theme/app_textstyle.dart';
import 'package:nxcar/feature/splash/screen/splash_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CommonAppBar(
        leadingOnTap: () {
          ///User should be logged out here after Authentication
          ///So, Moving back to Splash Screen
          Get.offAll(() => SplashScreen());
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0).w,
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 96.w,
              ),
              SvgPicture.asset(
                AppIcons.character,
              ),
              SizedBox(
                height: 52.h,
              ),
              Text(
                "You’re successfully logged in!",
                style: AppTextStyle.f24w400,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
