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
  final User user;
  final int totalCalorie;
  final String accessToken;

  Data({
    required this.user,
    required this.totalCalorie,
    required this.accessToken,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    user: User.fromJson(json["user"]),
    totalCalorie: json["totalCalorie"],
    accessToken: json["accessToken"],
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "totalCalorie": totalCalorie,
    "accessToken": accessToken,
  };
}

class User {
  final String id;
  final String name;
  final String email;

  User({
    required this.id,
    required this.name,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    name: json["name"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "email": email,
  };
}