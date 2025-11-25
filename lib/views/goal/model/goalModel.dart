class Goal {
  String? id;
  String title;
  bool completed;

  Goal({
    this.id,
    required this.title,
    this.completed = false,
  });
}

// API Response Model
class HomeGoalModel {
  int? statusCode;
  bool? success;
  String? message;
  dynamic meta;
  List<GoalData>? data;

  HomeGoalModel({
    this.statusCode,
    this.success,
    this.message,
    this.meta,
    this.data,
  });

  factory HomeGoalModel.fromJson(Map<String, dynamic> json) {
    return HomeGoalModel(
      statusCode: json['statusCode'],
      success: json['success'],
      message: json['message'],
      meta: json['meta'],
      data: json['data'] != null
          ? List<GoalData>.from(
          json['data'].map((x) => GoalData.fromJson(x)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'statusCode': statusCode,
      'success': success,
      'message': message,
      'meta': meta,
      'data': data?.map((x) => x.toJson()).toList(),
    };
  }
}

class GoalData {
  String? id;
  String? user;
  String? title;
  bool? isCompleted;
  String? type;
  String? createdAt;
  String? updatedAt;
  int? v;

  GoalData({
    this.id,
    this.user,
    this.title,
    this.isCompleted,
    this.type,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory GoalData.fromJson(Map<String, dynamic> json) {
    return GoalData(
      id: json['_id'],
      user: json['user'],
      title: json['title'],
      isCompleted: json['isCompleted'],
      type: json['type'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'user': user,
      'title': title,
      'isCompleted': isCompleted,
      'type': type,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
    };
  }
}