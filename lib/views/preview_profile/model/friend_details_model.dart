class FriendDetailsModel {
  final int statusCode;
  final bool success;
  final String message;
  final dynamic? meta;
  final Data data;

  FriendDetailsModel({
    required this.statusCode,
    required this.success,
    required this.message,
    this.meta,
    required this.data,
  });

  factory FriendDetailsModel.fromJson(Map<String, dynamic> json) =>
      FriendDetailsModel(
        statusCode: json["statusCode"],
        success: json["success"],
        message: json["message"],
        meta: json["meta"],
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  final Details details;
  final List<ProgressImages> progressImages;

  Data({required this.details, required this.progressImages});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    details: Details.fromJson(json["details"]),
    progressImages: (json["images"] as List<dynamic>?)
        ?.map((x) => ProgressImages.fromJson(x as Map<String, dynamic>))
        .toList()
        ?? [],

  );
}

class Details {
  final String id;
  final String mainGoal;
  final List<Consistency> consistency;
  final String name;

  Details({
    required this.id,
    required this.mainGoal,
    required this.consistency,
    required this.name,
  });

  factory Details.fromJson(Map<String, dynamic> json) => Details(
    id: json["_id"],
    mainGoal: json["mainGoal"],
    consistency: (json["consistency"] as List<dynamic>)
        .map((x) => Consistency.fromJson(x as Map<String, dynamic>))
        .toList(),
    name: json["name"],
  );
}

class ProgressImages {
  final String id;
  final String user;
  final String url;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int V;

  ProgressImages({
    required this.id,
    required this.user,
    required this.url,
    required this.createdAt,
    required this.updatedAt,
    required this.V,
  });

  factory ProgressImages.fromJson(Map<String, dynamic> json) => ProgressImages(
    id: json["_id"],
    user: json["user"],
    url: json["url"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    V: json["__v"],
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

  factory Consistency.fromJson(Map<String, dynamic> json) => Consistency(
    completed: json["completed"],
    createdAt: DateTime.parse(json["createdAt"]),
    id: json["_id"],
  );
}
