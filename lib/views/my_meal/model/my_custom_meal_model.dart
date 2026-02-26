class MyCustomMealModel {
  final int statusCode;
  final bool success;
  final String message;
  final dynamic meta;
  final List<Datum> data;

  MyCustomMealModel({
    required this.statusCode,
    required this.success,
    required this.message,
    required this.meta,
    required this.data,
  });

  factory MyCustomMealModel.fromJson(Map<String, dynamic> json) => MyCustomMealModel(
    statusCode: json["statusCode"],
    success: json["success"],
    message: json["message"],
    meta: json["meta"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

}

class Datum {
  final String id;
  final String user;
  final String name;
  final String description;
  final String image;
  final String time;
  final Details details;
  final Macros macros;
  final List<Ingredient> ingredients;
  final List<String> instructions;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  Datum({
    required this.id,
    required this.user,
    required this.name,
    required this.description,
    required this.image,
    required this.time,
    required this.details,
    required this.macros,
    required this.ingredients,
    required this.instructions,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    user: json["user"],
    name: json["name"],
    description: json["description"],
    image: json["image"],
    time: json["time"],
    details: Details.fromJson(json["details"]),
    macros: Macros.fromJson(json["macros"]),
    ingredients: List<Ingredient>.from(json["ingredients"].map((x) => Ingredient.fromJson(x))),
    instructions: List<String>.from(json["instructions"].map((x) => x)),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

}

class Details {
  final int price;
  final int calories;
  final int prepTime;

  Details({
    required this.price,
    required this.calories,
    required this.prepTime,
  });

  factory Details.fromJson(Map<String, dynamic> json) => Details(
    price: json["price"],
    calories: json["calories"],
    prepTime: json["prepTime"],
  );

  Map<String, dynamic> toJson() => {
    "price": price,
    "calories": calories,
    "prepTime": prepTime,
  };
}

class Ingredient {
  final String name;
  final String quantity;
  final String id;

  Ingredient({
    required this.name,
    required this.quantity,
    required this.id,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
    name: json["name"],
    quantity: json["quantity"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "quantity": quantity,
    "_id": id,
  };
}

class Macros {
  final int carbs;
  final int protein;
  final int fat;

  Macros({
    required this.carbs,
    required this.protein,
    required this.fat,
  });

  factory Macros.fromJson(Map<String, dynamic> json) => Macros(
    carbs: json["carbs"],
    protein: json["protein"],
    fat: json["fat"],
  );

}
