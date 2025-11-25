// To parse this JSON data, do
//
//     final faqModel = faqModelFromJson(jsonString);

import 'dart:convert';

FaqModel faqModelFromJson(String str) => FaqModel.fromJson(json.decode(str));

String faqModelToJson(FaqModel data) => json.encode(data.toJson());

class FaqModel {
  final int statusCode;
  final bool success;
  final String message;
  final dynamic meta;
  final List<FaqData> data;

  FaqModel({
    required this.statusCode,
    required this.success,
    required this.message,
    required this.meta,
    required this.data,
  });

  factory FaqModel.fromJson(Map<String, dynamic> json) => FaqModel(
    statusCode: json["statusCode"],
    success: json["success"],
    message: json["message"],
    meta: json["meta"],
    data: List<FaqData>.from(json["data"].map((x) => FaqData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "message": message,
    "meta": meta,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class FaqData {
  final String id;
  final String question;
  final String answer;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  FaqData({
    required this.id,
    required this.question,
    required this.answer,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory FaqData.fromJson(Map<String, dynamic> json) => FaqData(
    id: json["_id"],
    question: json["question"],
    answer: json["answer"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "question": question,
    "answer": answer,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
