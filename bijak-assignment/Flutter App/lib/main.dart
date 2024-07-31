import 'package:bijakassignment/common/theme/app_theme.dart';
import 'package:bijakassignment/constants/bindings.dart';
import 'package:bijakassignment/feature/home/controller/home_controller.dart';
import 'package:bijakassignment/feature/home/screen/home_screen.dart';
import 'package:bijakassignment/feature/product_detail/controller/product_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bijak',
      theme: AppTheme.lightTheme,
      initialBinding: InitialBinding(),
      home: const HomeScreen(),
    );
  }
}
