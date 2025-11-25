class BasicSuccessModel {
  final bool success;
  final int statusCode;
  final String message;

  BasicSuccessModel({
    required this.success,
    required this.statusCode,
    required this.message,
  });

  factory BasicSuccessModel.fromJson(Map<String, dynamic> json) => BasicSuccessModel(
    success: json["success"],
    statusCode: json["statusCode"],
    message: json["message"],
  );
}