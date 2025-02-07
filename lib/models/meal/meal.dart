
import 'package:json_annotation/json_annotation.dart';

part 'meal.g.dart'; // Generated file

@JsonSerializable()
class Meal{
  final String? idMeal;
  final String? strMeal;
  final String? strCategory;
  final String? strArea;
  final String? strInstructions;
  final String? strMealThumb;
  final String? strTags;
  final String? strYoutube;
  final List<String>? ingredients;

  Meal({
    this.idMeal,
    this.strMeal,
    this.strCategory,
    this.strArea,
    this.strInstructions,
    this.strMealThumb,
    this.strTags,
    this.strYoutube,
    this.ingredients,
  });

  // Factory method to create an instance from JSON
  factory Meal.fromJson(Map<String, dynamic> json) {
    List<String> extractIngredients(Map<String, dynamic> json) {
      List<String> ingredients = <String>[];
      for (int i = 1; i <= 20; i++) {
        final String? ingredient = json['strIngredient$i'];
        if (ingredient != null && ingredient.isNotEmpty) {
          ingredients.add(ingredient);
        }
      }
      return ingredients;
    }

    return Meal(
      idMeal: json['idMeal'] ?? '',
      strMeal: json['strMeal'] ?? '',
      strCategory: json['strCategory'] ?? '',
      strArea: json['strArea'] ?? '',
      strInstructions: json['strInstructions'] ?? '',
      strMealThumb: json['strMealThumb'] ?? '',
      strTags: json['strTags'] ?? '',
      strYoutube: json['strYoutube'] ?? '',
      ingredients: extractIngredients(json),
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() => _$MealToJson(this);
}
