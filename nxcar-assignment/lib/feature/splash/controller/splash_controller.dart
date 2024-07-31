import 'package:get/get.dart';
import 'package:nxcar/core/constants/app_enum.dart';
import 'package:nxcar/feature/authentication/screen/authentication_screen.dart';

class SplashController extends GetxController {
  RxInt currentIndex = 0.obs;

  RxBool isSwapped = false.obs;

  RxBool isButtonDisabled = false.obs;

  Rx<PositionState> positionState = PositionState.initial.obs;

  static List<String> splashTitles = [
    "Buy a Pre Owned Car\nwith Confidence",
    "Rev Up Your Dreams with\nOur Used Car Loans",
    "Simplified Used Car\nFinancing with Nxcar",
  ];

  ///Updates Animation State
  void arrowForwardOnTap(index) {
    isButtonDisabled.value = true;
    if (index == 0) {
      positionState.value = PositionState.second;
      currentIndex++;
      isButtonDisabled.value = false;
    } else if (index >= 1 && index < 4) {
      Future.delayed(Duration(seconds: 0), () {
        positionState.value = PositionState.third;
        currentIndex++;
      }).then((value) => {
            Future.delayed(Duration(milliseconds: 1200), () {
              positionState.value = PositionState.fourth;
              currentIndex++;
            }).then((value) => {
                  Future.delayed(Duration(seconds: 1), () {
                    positionState.value = PositionState.fifth;
                    currentIndex++;
                  })
                })
          });
      isButtonDisabled.value = false;
    } else {
      Get.to(() => AuthenticationScreen());
      isButtonDisabled.value = false;
    }
  }

  void goBack(index) {
    currentIndex.value--;
  }
}
