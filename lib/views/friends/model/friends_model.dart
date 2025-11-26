// To parse this JSON data, do
//
//     final friendsModel = friendsModelFromJson(jsonString);

import 'dart:convert';

FriendsModel friendsModelFromJson(String str) =>
    FriendsModel.fromJson(json.decode(str));

String friendsModelToJson(FriendsModel data) => json.encode(data.toJson());

class FriendsModel {
  final int statusCode;
  final bool success;
  final String message;
  final List<Friends> friends;

  FriendsModel({
    required this.statusCode,
    required this.success,
    required this.message,
    required this.friends,
  });

  factory FriendsModel.fromJson(Map<String, dynamic> json) => FriendsModel(
    statusCode: json["statusCode"],
    success: json["success"],
    message: json["message"],
    friends: List<Friends>.from(json["data"].map((x) => Friends.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "message": message,
    "data": List<dynamic>.from(friends.map((x) => x.toJson())),
  };
}

class Friends {
  final String friendId;
  final String name;
  final String mainGoal;
  final dynamic image;
  final int percentage;

  Friends({
    required this.friendId,
    required this.name,
    required this.mainGoal,
    required this.image,
    required this.percentage,
  });

  factory Friends.fromJson(Map<String, dynamic> json) => Friends(
    friendId: json["friendId"] ?? '',
    name: json["name"],
    mainGoal: json["mainGoal"],
    image: json["image"],
    percentage: json["percentage"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "friendId": friendId,
    "name": name,
    "mainGoal": mainGoal,
    "image": image,
    "percentage": percentage,
  };
}
