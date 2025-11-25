// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  final int statusCode;
  final bool success;
  final String message;
  final Data data;

  LoginModel({
    required this.statusCode,
    required this.success,
    required this.message,
    required this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    statusCode: json["statusCode"],
    success: json["success"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "message": message,
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
  final bool isBlocked;

  User({
    required this.name,
    required this.email,
    required this.isBlocked,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json["name"],
    email: json["email"],
    isBlocked: json["isBlocked"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "isBlocked": isBlocked,
  };
}
