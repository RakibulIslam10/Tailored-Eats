class WeightControlModel {
  final int statusCode;
  final bool success;
  final String message;
  final List<WeightDatas> data;

  WeightControlModel({
    required this.statusCode,
    required this.success,
    required this.message,
    required this.data,
  });

  factory WeightControlModel.fromJson(Map<String, dynamic> json) =>
      WeightControlModel(
        statusCode: json["statusCode"],
        success: json["success"],
        message: json["message"],
        data: List<WeightDatas>.from(
          json["data"].map((x) => WeightDatas.fromJson(x)),
        ),
      );
}

class WeightDatas {
  final String id;
  final String user;
  final int weightKg;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  WeightDatas({
    required this.id,
    required this.user,
    required this.weightKg,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory WeightDatas.fromJson(Map<String, dynamic> json) => WeightDatas(
    id: json["_id"],
    user: json["user"],
    weightKg: json["weightKg"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );
}
