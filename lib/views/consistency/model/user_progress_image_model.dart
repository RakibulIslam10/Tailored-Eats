class UserProgressImageModel {
  final int statusCode;
  final bool success;
  final String message;
  final List<DatumData> data;

  UserProgressImageModel({
    required this.statusCode,
    required this.success,
    required this.message,
    required this.data,
  });

  factory UserProgressImageModel.fromJson(Map<String, dynamic> json) =>
      UserProgressImageModel(
        statusCode: json["statusCode"],
        success: json["success"],
        message: json["message"],
        data: List<DatumData>.from(json["data"].map((x) => DatumData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DatumData {
  final String id;
  final String user;
  final String url;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  DatumData({
    required this.id,
    required this.user,
    required this.url,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory DatumData.fromJson(Map<String, dynamic> json) => DatumData(
    id: json["_id"],
    user: json["user"],
    url: json["url"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "user": user,
    "url": url,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
