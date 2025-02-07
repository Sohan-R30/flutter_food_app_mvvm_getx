import 'package:json_annotation/json_annotation.dart';

part 'simple_meal.g.dart';

@JsonSerializable()
class SimpleMeal{
  final String idMeal;
  final String strMeal;
  final String strMealThumb;

  SimpleMeal({
    required this.idMeal,
    required this.strMeal,
    required this.strMealThumb
  });

  // Factory method to create an instance from JSON
  factory SimpleMeal.fromJson(Map<String, dynamic> json) => _$SimpleMealFromJson(json);

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() => _$SimpleMealToJson(this);

}

