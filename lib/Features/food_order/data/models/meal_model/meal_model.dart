import 'dart:convert';

class MealModel {
  String? foodName;
  int? calories;
  String? imageUrl;
  int salary;

  MealModel({this.foodName, this.calories, this.imageUrl, required this.salary});

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [MealModel].
  factory MealModel.fromJson(String data) {
    return MealModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  factory MealModel.fromMap(Map<String, dynamic> data) => MealModel(
        foodName: data['food_name'] as String?,
        calories: data['calories'] as int?,
        imageUrl: data['image_url'] as String?,
        salary: data['salary'] as int,
      );

  /// `dart:convert`
  ///
  /// Converts [MealModel] to a JSON string.
  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'food_name': foodName,
        'calories': calories,
        'image_url': imageUrl,
        'salary': salary,
      };
}
