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
}

class Data {
  final User user;
  final String accessToken;

  Data({required this.user, required this.accessToken});

  factory Data.fromJson(Map<String, dynamic> json) =>
      Data(user: User.fromJson(json["user"]), accessToken: json["accessToken"]);
}

class User {
  final String name;
  final String email;
  final String userId;
  final bool isBlocked;

  User({
    required this.name,
    required this.email,
    required this.userId,
    required this.isBlocked,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json["name"],
    email: json["email"],
    userId: json["id"],
    isBlocked: json["isBlocked"],
  );
}
