class Otp {
  bool? status;
  String? message;
  String? otp;

  Otp({this.status, this.message, this.otp});

  factory Otp.fromJson(Map<String, dynamic> json) => Otp(
        status: json['status'] as bool?,
        message: json['message'] as String?,
        otp: json['otp'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'otp': otp,
      };
}
