class AppValidators {
  static String? validateMobile({String? value}) {
    // Indian Mobile number are of 10 digit only
    if (value?.length != 10) {
      return 'Mobile Number must be of 10 digit';
    }  else {
      return null;
    }
  }

  static String? validateEmail({required String? email}) {
    if (email == null || email == "") {
      return "Email Cannot be Empty";
    }
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (!emailValid) {
      return "Email is invalid";
    } else {
      return null;
    }
  }

  static String? validateVehicleNumber({required String? vehicleNumber}) {
    if (vehicleNumber == null || vehicleNumber == "") {
      return "Vehicle Number Cannot be Empty";
    }
    final bool emailValid = RegExp(r"^[A-Z]{2}[0-9]{2}[A-Z]{1,2}[0-9]{4}$")
        .hasMatch(vehicleNumber);
    if (!emailValid) {
      return "Vehicle Number is invalid";
    } else {
      return null;
    }
  }

  static String? validateEmpty({required String? value, String? message}) {
    if (value?.isEmpty ?? true) {
      return message ?? "Field cannot be empty";
    } else {
      return null;
    }
  }
}
