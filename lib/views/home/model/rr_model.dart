class RrModel {
  final int statusCode;
  final bool success;
  final String message;
  final dynamic? meta;
  final List<Datum> data;

  RrModel({
    required this.statusCode,
    required this.success,
    required this.message,
    this.meta,
    required this.data,
  });

  factory RrModel.fromJson(Map<String, dynamic> json) => RrModel(
    statusCode: json["statusCode"],
    success: json["success"],
    message: json["message"],
    meta: json["meta"],
    data: (json["data"] as List<dynamic>).map((x) => Datum.fromJson(x as Map<String, dynamic>)).toList(),
  );
}

class Datum {
  final String id;
  final String user;
  final String message;
  final bool read;
  final DateTime createdAt;
  final int V;

  Datum({
    required this.id,
    required this.user,
    required this.message,
    required this.read,
    required this.createdAt,
    required this.V,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    user: json["user"],
    message: json["message"],
    read: json["read"],
    createdAt: DateTime.parse(json["createdAt"]),
    V: json["__v"],
  );
}
