import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nxcar/core/constants/app_enum.dart';
import 'package:nxcar/feature/authentication/model/otp/otp_verification_request_model.dart';
import 'package:nxcar/feature/authentication/model/otp/otp_verification_response_model.dart';
import 'package:nxcar/feature/authentication/model/signup/signup_request_model.dart';
import 'package:nxcar/feature/authentication/model/signup/signup_response_model.dart';
import 'package:nxcar/feature/authentication/repository/authentication_respository.dart';
import 'package:nxcar/feature/authentication/screen/otp_screen.dart';
import 'package:nxcar/feature/home/screen/home_screen.dart';

class AuthenticationController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final AuthenticationRepository _authenticationRepository =
      AuthenticationRepository();

  final Rx<TextEditingController> numberCtrl = TextEditingController().obs;

  final Rx<TextEditingController> nameCtrl = TextEditingController().obs;

  final Rx<TextEditingController> emailCtrl = TextEditingController().obs;

  final Rx<TextEditingController> vehicleNumberCtrl =
      TextEditingController().obs;

  final Rx<TextEditingController> otpCtrl = TextEditingController().obs;

  Rx<ApiState> signUpState = ApiState.initial.obs;

  Rx<ApiState> otpVerificationState = ApiState.initial.obs;

  RxBool isOTPInvalid = false.obs;

  void onDetailsFilled() {
    if (formKey.currentState?.validate() ?? false) {
      _signUp(
          signupRequestModel: SignupRequestModel(
        mobile: numberCtrl.value.text,
        name: emailCtrl.value.text,
        email: emailCtrl.value.text,
        vehicleNo: vehicleNumberCtrl.value.text,
      ));
    }
  }

  void onOTPSubmitted() {
    Get.offAll(() => HomeScreen());
  }

  _signUp({required SignupRequestModel signupRequestModel}) async {
    signUpState.value = ApiState.loading;

    final SignupResponseModel? signupResponseModel =
        await _authenticationRepository.signUp(
      signupRequestModel: signupRequestModel,
    );

    if (signupResponseModel?.status == true) {
      signUpState.value = ApiState.success;
      Fluttertoast.showToast(msg: signupResponseModel?.message ?? "OTP Sent");
      if (signupResponseModel?.otp != null) {
        otpCtrl.value.text = signupResponseModel!.otp.toString();
      }

      ///Navigating to OTP screen on Success
      Get.off(() => OTPScreen());
    } else {
      signUpState.value = ApiState.error;
    }
  }

  void otpVerification(
      {required OtpVerificationRequestModel
          otpVerificationRequestModel}) async {
    otpVerificationState.value = ApiState.loading;

    final OtpVerificationResponseModel? otpVerificationResponseModel =
        await _authenticationRepository.otpVerification(
            otpVerificationRequestModel: otpVerificationRequestModel);

    if (otpVerificationResponseModel?.status == true) {
      otpVerificationState.value = ApiState.success;
      Fluttertoast.showToast(
          msg: otpVerificationResponseModel?.message ?? "OTP Verified");

      Get.offAll(() => HomeScreen());
    } else {
      otpVerificationState.value = ApiState.error;
    }
  }
}
