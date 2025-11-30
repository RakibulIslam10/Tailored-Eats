// To parse this JSON data, do
//
//     final friendsRequestModel = friendsRequestModelFromJson(jsonString);

import 'dart:convert';

FriendsRequestModel friendsRequestModelFromJson(String str) => FriendsRequestModel.fromJson(json.decode(str));

String friendsRequestModelToJson(FriendsRequestModel data) => json.encode(data.toJson());

class FriendsRequestModel {
  final int statusCode;
  final bool success;
  final String message;
  final dynamic meta;
  final List<Requests> requests;

  FriendsRequestModel({
    required this.statusCode,
    required this.success,
    required this.message,
    required this.meta,
    required this.requests,
  });

  factory FriendsRequestModel.fromJson(Map<String, dynamic> json) => FriendsRequestModel(
    statusCode: json["statusCode"],
    success: json["success"],
    message: json["message"],
    meta: json["meta"],
    requests: List<Requests>.from(json["data"].map((x) => Requests.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "message": message,
    "meta": meta,
    "data": List<dynamic>.from(requests.map((x) => x.toJson())),
  };
}

class Requests {
  final DateTime createdAt;
  final String senderId;
  final String name;
  final String mainGoal;
  final dynamic image;

  Requests({
    required this.createdAt,
    required this.senderId,
    required this.name,
    required this.mainGoal,
    required this.image,
  });

  factory Requests.fromJson(Map<String, dynamic> json) => Requests(
    createdAt: DateTime.parse(json["createdAt"]),
    senderId: json["senderId"],
    name: json["name"],
    mainGoal: json["mainGoal"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt.toIso8601String(),
    "senderId": senderId,
    "name": name,
    "mainGoal": mainGoal,
    "image": image,
  };
}
