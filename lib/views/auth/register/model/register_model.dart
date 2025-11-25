class RegisterModel {
  final int statusCode;
  final bool success;
  final String message;
  final dynamic meta;
  final Data data;

  RegisterModel({
    required this.statusCode,
    required this.success,
    required this.message,
    required this.meta,
    required this.data,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
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
  final String accessToken;

  Data({
    required this.user,
    required this.accessToken,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    user: User.fromJson(json["user"]),
    accessToken: json["accessToken"],
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "accessToken": accessToken,
  };
}

class User {
  final String name;
  final String email;

  User({
    required this.name,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json["name"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
  };
}
