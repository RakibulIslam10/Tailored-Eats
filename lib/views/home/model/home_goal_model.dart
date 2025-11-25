// To parse this JSON data, do
//
//     final homeGoalModel = homeGoalModelFromJson(jsonString);

import 'dart:convert';

HomeGoalModel homeGoalModelFromJson(String str) => HomeGoalModel.fromJson(json.decode(str));

String homeGoalModelToJson(HomeGoalModel data) => json.encode(data.toJson());

class HomeGoalModel {
  final int statusCode;
  final bool success;
  final String message;
  final List<DailyGoal> dailyGoal;

  HomeGoalModel({
    required this.statusCode,
    required this.success,
    required this.message,
    required this.dailyGoal,
  });

  factory HomeGoalModel.fromJson(Map<String, dynamic> json) => HomeGoalModel(
    statusCode: json["statusCode"],
    success: json["success"],
    message: json["message"],
    dailyGoal: List<DailyGoal>.from(json["data"].map((x) => DailyGoal.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "message": message,
    "data": List<dynamic>.from(dailyGoal.map((x) => x.toJson())),
  };
}

class DailyGoal {
  final String id;
  final String user;
  final String title;
  final bool isCompleted;
  final String type;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  DailyGoal({
    required this.id,
    required this.user,
    required this.title,
    required this.isCompleted,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory DailyGoal.fromJson(Map<String, dynamic> json) => DailyGoal(
    id: json["_id"],
    user: json["user"],
    title: json["title"],
    isCompleted: json["isCompleted"],
    type: json["type"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "user": user,
    "title": title,
    "isCompleted": isCompleted,
    "type": type,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}