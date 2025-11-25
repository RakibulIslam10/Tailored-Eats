// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

class NotificationModel {
  final int statusCode;
  final bool success;
  final String message;
  final List<Notifications> notifications;

  NotificationModel({
    required this.statusCode,
    required this.success,
    required this.message,
    required this.notifications,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        statusCode: json["statusCode"],
        success: json["success"],
        message: json["message"],
        notifications: List<Notifications>.from(json["data"].map((x) => Notifications.fromJson(x))),
      );

}

class Notifications {
  final String id;
  final String user;
  final String message;
  final bool read;
  final DateTime createdAt;
  final int v;

  Notifications({
    required this.id,
    required this.user,
    required this.message,
    required this.read,
    required this.createdAt,
    required this.v,
  });

  factory Notifications.fromJson(Map<String, dynamic> json) => Notifications(
    id: json["_id"],
    user: json["user"],
    message: json["message"],
    read: json["read"],
    createdAt: DateTime.parse(json["createdAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "user": user,
    "message": message,
    "read": read,
    "createdAt": createdAt.toIso8601String(),
    "__v": v,
  };
}
