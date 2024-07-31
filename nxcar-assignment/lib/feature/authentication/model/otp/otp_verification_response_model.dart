class OtpVerificationResponseModel {
  bool? status;
  String? mobile;
  String? id;
  String? message;
  String? accessToken;

  OtpVerificationResponseModel({
    this.status,
    this.mobile,
    this.id,
    this.message,
    this.accessToken,
  });

  factory OtpVerificationResponseModel.fromJson(Map<String, dynamic> json) => OtpVerificationResponseModel(
    status: json["status"],
    mobile: json["mobile"],
    id: json["id"],
    message: json["message"],
    accessToken: json["access_token"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "mobile": mobile,
    "id": id,
    "message": message,
    "access_token": accessToken,
  };
}
