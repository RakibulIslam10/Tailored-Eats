class SuggestFriendModel {
  final List<Suggests> data;

  SuggestFriendModel({required this.data});

  factory SuggestFriendModel.fromJson(Map<String, dynamic> json) {
    return SuggestFriendModel(
      data: (json['data'] as List<dynamic>? ?? [])
          .map((e) => Suggests.fromJson(e as Map<String, dynamic>))
          .where((s) => s.name.isNotEmpty)
          .toList(),
    );
  }
}

class Suggests {
  final String id;
  final String name;
  final String email;
  final int age;
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

  factory Suggests.fromJson(Map<String, dynamic> json) {
    return Suggests(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      age: json['age'] ?? 0,
      gender: json['gender'] ?? '',
      mainGoal: json['mainGoal'] ?? '',
    );
  }
}