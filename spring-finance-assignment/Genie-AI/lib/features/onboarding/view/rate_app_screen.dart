import 'package:flutter/material.dart';
import 'package:genie/constant/asset_constant.dart';
import 'package:genie/constant/color_constant.dart';
import 'package:genie/features/chat_gpt/view/chat_gpt.dart';
import 'package:get/get.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:lottie/lottie.dart';

class RateApplication extends StatefulWidget {
  const RateApplication({Key? key}) : super(key: key);

  @override
  State<RateApplication> createState() => _RateApplicationState();
}

class _RateApplicationState extends State<RateApplication> {
  final InAppReview inAppReview = InAppReview.instance;

  requestReview() async {
    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
    }
  }

  @override
  void initState() {
    requestReview();
    super.initState();
  }

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
                  'Help Us Grow',
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
                  'Show your love by giving us a review on the Play Store.',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColor.greyColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Center(child: Lottie.asset(AssetConstants.plantGrowing)),
                const Spacer(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .08,
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                      ),
                      onPressed: () {
                        Get.to(() => const ChatPage());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            'Continue',
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
