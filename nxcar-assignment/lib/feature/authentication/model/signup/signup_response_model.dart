class SignupResponseModel {
  bool? status;
  int? id;
  int? otp;
  String? message;

  SignupResponseModel({
    this.status,
    this.id,
    this.otp,
    this.message,
  });

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) => SignupResponseModel(
    status: json["status"],
    id: json["id"],
    otp: json["otp"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "id": id,
    "otp": otp,
    "message": message,
  };
}
