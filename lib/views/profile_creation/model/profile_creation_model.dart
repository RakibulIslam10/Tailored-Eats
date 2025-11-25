class ProfileCreationModel {
  final int statusCode;
  final bool success;
  final String message;
  final dynamic meta;
  final Data data;

  ProfileCreationModel({
    required this.statusCode,
    required this.success,
    required this.message,
    required this.meta,
    required this.data,
  });

  factory ProfileCreationModel.fromJson(Map<String, dynamic> json) => ProfileCreationModel(
    statusCode: json["statusCode"],
    success: json["success"],
    message: json["message"],
    meta: json["meta"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "message": message,
    "meta": meta,
    "data": data.toJson(),
  };
}

class Data {
  final dynamic totalCalorie;

  Data({
    required this.totalCalorie,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    totalCalorie: json["totalCalorie"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "totalCalorie": totalCalorie,
  };
}
