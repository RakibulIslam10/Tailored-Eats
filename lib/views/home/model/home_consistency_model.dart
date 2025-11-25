// To parse this JSON data, do
//
//     final homeConsistencyModel = homeConsistencyModelFromJson(jsonString);

import 'dart:convert';

HomeConsistencyModel homeConsistencyModelFromJson(String str) => HomeConsistencyModel.fromJson(json.decode(str));

String homeConsistencyModelToJson(HomeConsistencyModel data) => json.encode(data.toJson());

class HomeConsistencyModel {
  final int statusCode;
  final bool success;
  final String message;
  final dynamic meta;
  final Data data;

  HomeConsistencyModel({
    required this.statusCode,
    required this.success,
    required this.message,
    required this.meta,
    required this.data,
  });

  factory HomeConsistencyModel.fromJson(Map<String, dynamic> json) => HomeConsistencyModel(
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
  final TodayCompleted todayCompleted;
  final List<Consistency> consistency;
  final List<dynamic> friendsData;

  Data({
    required this.todayCompleted,
    required this.consistency,
    required this.friendsData,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    todayCompleted: TodayCompleted.fromJson(json["todayCompleted"]),
    consistency: List<Consistency>.from(json["consistency"].map((x) => Consistency.fromJson(x))),
    friendsData: List<dynamic>.from(json["friendsData"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "todayCompleted": todayCompleted.toJson(),
    "consistency": List<dynamic>.from(consistency.map((x) => x.toJson())),
    "friendsData": List<dynamic>.from(friendsData.map((x) => x)),
  };
}

class Consistency {
  final int completed;
  final DateTime createdAt;
  final String id;

  Consistency({
    required this.completed,
    required this.createdAt,
    required this.id,
  });

  factory Consistency.fromJson(Map<String, dynamic> json) => Consistency(
    completed: json["completed"],
    createdAt: DateTime.parse(json["createdAt"]),
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "completed": completed,
    "createdAt": createdAt.toIso8601String(),
    "_id": id,
  };
}

class TodayCompleted {
  final String id;
  final int percentage;

  TodayCompleted({
    required this.id,
    required this.percentage,
  });

  factory TodayCompleted.fromJson(Map<String, dynamic> json) => TodayCompleted(
    id: json["_id"],
    percentage: json["percentage"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "percentage": percentage,
  };
}