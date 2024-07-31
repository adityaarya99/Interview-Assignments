import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:genie/constant/asset_constant.dart';
import 'package:genie/constant/color_constant.dart';
import 'package:genie/constant/text_style_constant.dart';
import 'package:genie/features/chat_gpt/view/chat_gpt.dart';
import 'package:genie/features/onboarding/view/rate_app_screen.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blackColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                const Text(
                  'Your AI Assistant',
                  style: TextStyle(
                    fontSize: 24,
                    color: AppColor.whiteColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                const Text(
                  'Chat with the world\'s most advance AI on your mobile phone! Ask questions and get mind blowing answers.',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColor.greyColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                Center(child: Lottie.asset(AssetConstants.onBoardBot)),
                Center(
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Hi, Nice to meet you !',
                        textStyle: const TextStyle(
                          fontSize: 28.0,
                          color: AppColor.whiteColor,
                          fontWeight: FontWeight.w700,
                        ),
                        speed: const Duration(milliseconds: 200),
                      ),
                    ],
                    isRepeatingAnimation: true,
                    pause: const Duration(milliseconds: 100),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .08,
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                      ),
                      onPressed: () {
                        Get.to(() => const RateApplication());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            'Lets Get Started',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: AppColor.blackColor),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: AppColor.blackColor,
                          ),
                        ],
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
