class MacrosModel {
  final int statusCode;
  final bool success;
  final String message;
  final Data data;

  MacrosModel({
    required this.statusCode,
    required this.success,
    required this.message,
    required this.data,
  });

  factory MacrosModel.fromJson(Map<String, dynamic> json) => MacrosModel(
    statusCode: json["statusCode"],
    success: json["success"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );
}

class Data {
  final String name;
  final String email;
  final String gender;
  final int height;
  final String goal;
  final List<Weight> weight;
  final Calorie calorie;

  Data({
    required this.name,
    required this.email,
    required this.gender,
    required this.height,
    required this.goal,
    required this.weight,
    required this.calorie,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    email: json["email"],
    gender: json["gender"],
    height: json["height"],
    goal: json["goal"],
    weight: List<Weight>.from(json["weight"].map((x) => Weight.fromJson(x))),
    calorie: Calorie.fromJson(json["calorie"]),
  );
}

class Calorie {
  final String id;
  final String user;
  final int consumedCalorie;
  final int calorieGoal;
  final int percentage;
  final int proteinGoal;
  final int fatGoal;
  final int carbGoal;
  final int consumedCarb;
  final int consumedFat;
  final int consumedProtein;
  final int completedGoal;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  Calorie({
    required this.id,
    required this.user,
    required this.consumedCalorie,
    required this.calorieGoal,
    required this.percentage,
    required this.proteinGoal,
    required this.fatGoal,
    required this.carbGoal,
    required this.consumedCarb,
    required this.consumedFat,
    required this.consumedProtein,
    required this.completedGoal,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Calorie.fromJson(Map<String, dynamic> json) => Calorie(
    id: json["_id"],
    user: json["user"],
    consumedCalorie: json["consumedCalorie"],
    calorieGoal: json["calorieGoal"],
    percentage: json["percentage"],
    proteinGoal: json["proteinGoal"],
    fatGoal: json["fatGoal"],
    carbGoal: json["carbGoal"],
    consumedCarb: json["consumedCarb"],
    consumedFat: json["consumedFat"],
    consumedProtein: json["consumedProtein"],
    completedGoal: json["completedGoal"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );
}

class Weight {
  final String id;
  final String user;
  final int weightKg;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  Weight({
    required this.id,
    required this.user,
    required this.weightKg,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Weight.fromJson(Map<String, dynamic> json) => Weight(
    id: json["_id"],
    user: json["user"],
    weightKg: json["weightKg"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );
}
