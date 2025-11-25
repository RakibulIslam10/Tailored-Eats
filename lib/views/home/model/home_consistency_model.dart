import 'dart:convert';

HomeConsistencyModel homeConsistencyModelFromJson(String str) =>
    HomeConsistencyModel.fromJson(json.decode(str));

String homeConsistencyModelToJson(HomeConsistencyModel data) =>
    json.encode(data.toJson());

class HomeConsistencyModel {
  final int statusCode;
  final bool success;
  final String message;
  final Data data;

  HomeConsistencyModel({
    required this.statusCode,
    required this.success,
    required this.message,
    required this.data,
  });

  factory HomeConsistencyModel.fromJson(Map<String, dynamic> json) =>
      HomeConsistencyModel(
        statusCode: json["statusCode"] ?? 0,
        success: json["success"] ?? false,
        message: json["message"] ?? '',
        data: json["data"] != null ? Data.fromJson(json["data"]) : Data.empty(),
      );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  final TodayCompleted todayCompleted;
  final List<Consistency> consistency;
  final List<FriendData> friendsData;

  Data({
    required this.todayCompleted,
    required this.consistency,
    required this.friendsData,
  });

  factory Data.fromJson(Map<String, dynamic>? json) => Data(
    todayCompleted: TodayCompleted.fromJson(json?["todayCompleted"]),
    consistency: (json?["consistency"] != null && json!["consistency"] is List)
        ? List<Consistency>.from(
        json["consistency"].map((x) => Consistency.fromJson(x)))
        : [],
    friendsData: (json?["friendsData"] != null && json!["friendsData"] is List)
        ? List<FriendData>.from(
        json["friendsData"].map((x) => FriendData.fromJson(x)))
        : [],
  );

  Map<String, dynamic> toJson() => {
    "todayCompleted": todayCompleted.toJson(),
    "consistency": List<dynamic>.from(consistency.map((x) => x.toJson())),
    "friendsData": List<dynamic>.from(friendsData.map((x) => x.toJson())),
  };

  factory Data.empty() => Data(
    todayCompleted: TodayCompleted.empty(),
    consistency: [],
    friendsData: [],
  );
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

  factory Consistency.fromJson(Map<String, dynamic>? json) => Consistency(
    completed: json?["completed"] ?? 0,
    createdAt: json?["createdAt"] != null
        ? DateTime.parse(json!["createdAt"])
        : DateTime.now(),
    id: json?["_id"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "completed": completed,
    "createdAt": createdAt.toIso8601String(),
    "_id": id,
  };
}

class TodayCompleted {
  final String id;
  final double percentage;

  TodayCompleted({
    required this.id,
    required this.percentage,
  });

  factory TodayCompleted.fromJson(Map<String, dynamic>? json) => TodayCompleted(
    id: json?["_id"] ?? '',
    percentage: json?["percentage"] != null
        ? (json!["percentage"] is int
        ? (json["percentage"] as int).toDouble()
        : (json["percentage"] is double
        ? json["percentage"] as double
        : double.tryParse(json["percentage"].toString()) ?? 0.0))
        : 0.0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "percentage": percentage,
  };

  factory TodayCompleted.empty() => TodayCompleted(id: '', percentage: 0.0);
}

class FriendData {
  final String userId;
  final String name;
  final String mainGoal;
  final double percentage;

  FriendData({
    required this.userId,
    required this.name,
    required this.mainGoal,
    required this.percentage,
  });

  factory FriendData.fromJson(Map<String, dynamic>? json) => FriendData(
    userId: json?["userId"] ?? '',
    name: json?["name"] ?? '',
    mainGoal: json?["mainGoal"] ?? '',
    percentage: json?["percentage"] != null
        ? (json!["percentage"] is int
        ? (json["percentage"] as int).toDouble()
        : (json["percentage"] is double
        ? json["percentage"] as double
        : double.tryParse(json["percentage"].toString()) ?? 0.0))
        : 0.0,
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "name": name,
    "mainGoal": mainGoal,
    "percentage": percentage,
  };
}
