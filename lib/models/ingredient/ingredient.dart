import 'package:json_annotation/json_annotation.dart';

part 'ingredient.g.dart';

@JsonSerializable()
class Ingredient{
  final String? idIngredient;
  final String? strIngredient;
  final String? strDescription;

  Ingredient({
    this.idIngredient,
    this.strIngredient,
    this.strDescription
  });

  // Factory method to create an instance from JSON
  factory Ingredient.fromJson(Map<String, dynamic> json) => _$IngredientFromJson(json);

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() => _$IngredientToJson(this);
}
