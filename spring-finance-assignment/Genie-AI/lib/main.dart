import 'package:flutter/material.dart';
import 'package:genie/features/chat_gpt/view/chat_gpt.dart';
import 'package:genie/features/onboarding/view/onboarding_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'cairo',
        primarySwatch: Colors.blue,
      ),
      home: const Onboarding(),
    );
  }
}
