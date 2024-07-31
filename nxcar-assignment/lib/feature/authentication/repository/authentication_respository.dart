import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:nxcar/core/routes/api_routes.dart';
import 'package:nxcar/feature/authentication/model/otp/otp_verification_request_model.dart';
import 'package:nxcar/feature/authentication/model/otp/otp_verification_response_model.dart';
import 'package:nxcar/feature/authentication/model/signup/signup_request_model.dart';
import 'package:nxcar/feature/authentication/model/signup/signup_response_model.dart';

class AuthenticationRepository {
  final _dio = Dio();

  Future<SignupResponseModel?> signUp(
      {required SignupRequestModel signupRequestModel}) async {
    try {
      final response = await _dio.post(ApiRoutes.signUp, data: {
        "mobile": signupRequestModel.mobile,
        "name": signupRequestModel.name,
        "email": signupRequestModel.email,
        "vehicle_no": signupRequestModel.vehicleNo,
        "pincode": signupRequestModel.pincode
      });
      if (response.statusCode == 200) {
        debugPrint("Success in Sign up Repo ${response.data}");
        return SignupResponseModel.fromJson(response.data as Map<String, dynamic>);
      }
      return null;
    } catch (error) {
      debugPrint("Error in Sign up repo ${error.toString()}");
      return null;
    }
  }

  Future<OtpVerificationResponseModel?> otpVerification(
      {required OtpVerificationRequestModel
          otpVerificationRequestModel}) async {
    try {
      final response = await _dio.post(ApiRoutes.otpVerification, data: {
        {
          "mobile": otpVerificationRequestModel.mobile,
          "otp": otpVerificationRequestModel.otp
        }
      });

      if (response.statusCode == 200) {
        debugPrint("Success in OTP Verification Repo ${response.data}");
        return OtpVerificationResponseModel.fromJson(
            response.data as Map<String, dynamic>);
      }

      return null;
    } catch (error) {
      debugPrint("Error in Sign up repo ${error.toString()}");
      return null;
    }
  }
}
