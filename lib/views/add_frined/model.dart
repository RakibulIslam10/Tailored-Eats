class SuggestFriendModel {
  final int statusCode;
  final bool success;
  final String message;
  final dynamic meta;
  final List<Suggests> data;

  SuggestFriendModel({
    required this.statusCode,
    required this.success,
    required this.message,
    required this.meta,
    required this.data,
  });

  factory SuggestFriendModel.fromJson(Map<String, dynamic> json) => SuggestFriendModel(
    statusCode: json["statusCode"],
    success: json["success"],
    message: json["message"],
    meta: json["meta"],
    data: List<Suggests>.from(json["data"].map((x) => Suggests.fromJson(x))),
  );
}

class Suggests {
  final String id;
  final String name;
  final String email;
  final dynamic age;
  final String gender;
  final String mainGoal;

  Suggests({
    required this.id,
    required this.name,
    required this.email,
    required this.age,
    required this.gender,
    required this.mainGoal,
  });

  factory Suggests.fromJson(Map<String, dynamic> json) => Suggests(
    id: json["_id"],
    name: json["name"] ?? '',
    email: json["email"] ?? '',
    age: json["age"] ?? 0,
    gender: json["gender"] ?? '',
    mainGoal: json["mainGoal"] ?? '',
  );

}
