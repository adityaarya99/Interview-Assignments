import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nxcar/animation.dart';
import 'package:nxcar/core/theme/app_theme.dart';
import 'package:nxcar/feature/authentication/screen/authentication_screen.dart';
import 'package:nxcar/feature/splash/controller/splash_controller.dart';
import 'package:nxcar/feature/splash/screen/splash_screen.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
  // runApp(DevicePreview(
  //   enabled: !kReleaseMode,
  //   builder: (context) => MyApp(), // Wrap your app
  // ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (_, child) {
        return GetMaterialApp(
          initialBinding: BindingsBuilder(() {
            Get.lazyPut<SplashController>(
              () => (SplashController()),
            );
          }),
          debugShowCheckedModeBanner: false,
          title: 'NxCar',
          theme: AppTheme.lightTheme,
          home: SplashScreen(),
        );
      },
    );
  }
}
