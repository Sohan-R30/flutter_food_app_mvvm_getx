import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category{
  final String idCategory;
  final String strCategory;
  final String strCategoryThumb;
  final String strCategoryDescription;

  Category({
    required this.idCategory,
    required this.strCategory,
    required this.strCategoryThumb,
    required this.strCategoryDescription
  });

  // Factory method to create an instance from JSON
  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}