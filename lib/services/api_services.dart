
import 'package:dio/dio.dart';
import 'package:food_app/exceptions/api_exception.dart';
import 'package:food_app/models/category/category.dart';
import 'package:food_app/models/ingredient/ingredient.dart';
import 'package:food_app/models/meal/meal.dart';
import 'package:food_app/models/simple_meal/simple_meal.dart';

class ApiServices{
  final Dio _dio = Dio();
  final String baseUrl = "https://www.themealdb.com/api/json/v1/1/";

  // Get a Random Meal
  Future<Meal> fetchRandomMeal() async{
    try{
      Response<Map<String, dynamic>> response = await _dio.get("${baseUrl}random.php");
      if(response.statusCode == 200){
        final Map<String, dynamic>? data = response.data;
        if(data != null && data['meals'] != null){
          return Meal.fromJson(data['meals'][0]);
        }
        throw ApiException("No meals found", statusCode: response.statusCode);
      }
      throw ApiException("No meals found", statusCode: response.statusCode);
    }
    on DioException catch(exception){
      throw ApiException(_handleDioException(exception), statusCode: exception.response?.statusCode);
    }
  }


  // Fetch All Meals (Limited to 20 Random Meals)
  Future<List<Meal>> fetchAllMeals() async{
    try{
      final Response<Map<String, dynamic>> response = await _dio.get("${baseUrl}search.php?s=");
      if(response.statusCode == 200){
        final Map<String, dynamic>? data = response.data;
        if(data != null && data['meals'] != null){
          List<dynamic> mealList = data['meals'];
          return mealList.map((dynamic meal) => Meal.fromJson(meal as Map<String, dynamic>)).toList();
        }
        throw ApiException("No meals found", statusCode: response.statusCode);
      }
      throw ApiException("No meals found", statusCode: response.statusCode);
    } on DioException catch(exception){
      throw ApiException(_handleDioException(exception), statusCode: exception.response?.statusCode);
    }
  }


  // Search Meals by Name
  Future<List<Meal>> searchMeals(String query) async{
    try{
      final Response<Map<String, dynamic>> response = await _dio.get("${baseUrl}search.php?s=$query");
      if(response.statusCode == 200){
        final Map<String, dynamic>? data = response.data;
        if(data != null && data['meals'] != null){
          List<dynamic> meals = data["meals"];
          return meals.map((dynamic json) => Meal.fromJson(json)).toList();
        }
        throw ApiException("No meals found", statusCode: response.statusCode);
      }
      throw ApiException("No meals found", statusCode: response.statusCode);
    }
    on DioException catch(exception){
      throw ApiException(_handleDioException(exception), statusCode: exception.response?.statusCode);
    }
  }

  // Get Meal Details by ID
  Future<Meal> fetchMealDetails(String mealId) async{
    try{
      final Response<Map<String, dynamic>> response = await _dio.get("${baseUrl}lookup.php?i=$mealId");
      if(response.statusCode == 200){
        final Map<String, dynamic>? data = response.data;

        if(data != null && data["meals"] != null){
          return Meal.fromJson(data["meals"][0]);
        }
        throw ApiException("No meals found", statusCode: response.statusCode);
      }
      throw ApiException("No meals found", statusCode: response.statusCode);
    }
    on DioException catch(exception){
      throw ApiException(_handleDioException(exception), statusCode: exception.response?.statusCode);
    }
  }


  // List Meals by Category
  Future<List<SimpleMeal>> fetchMealsByCategory(String category) async{
    try{
      final Response<Map<String, dynamic>> response = await _dio.get("${baseUrl}filter.php?c=$category");
      if(response.statusCode == 200){
        final Map<String, dynamic>? data = response.data;
        if(data != null && data["meals"] != null){
          List<dynamic> mealList = data["meals"];
          return mealList.map((dynamic json) => SimpleMeal.fromJson(json)).toList();
        }
        throw ApiException("No meals found", statusCode: response.statusCode);
      }
      throw ApiException("No meals found", statusCode: response.statusCode);
    }
    on DioException catch(exception){
      throw ApiException(_handleDioException(exception), statusCode: exception.response?.statusCode);
    }
  }

  // Filter Meals by Main Ingredient
  Future<List<SimpleMeal>> filterMealsByIngredient(String ingredient) async{
    try{
      final Response<Map<String, dynamic>> response = await _dio.get("${baseUrl}filter.php?i=$ingredient");
      if(response.statusCode == 200){
        final Map<String, dynamic>? data = response.data;
        if(data != null && data["meals"] != null){
          return (data["meals"] as List<Map<String, dynamic>>)
              .map((Map<String, dynamic> json) => SimpleMeal.fromJson(json)
          ).toList();
        }
        throw ApiException("No meals found", statusCode: response.statusCode);
      }
      throw ApiException("No meals found", statusCode: response.statusCode);
    }
    on DioException catch(exception){
      throw ApiException(_handleDioException(exception), statusCode: exception.response?.statusCode);
    }
  }

  // list all categories
  Future<List<Category>> fetchALlCategories() async{
    try{
      final Response<Map<String, dynamic>> response = await _dio.get("${baseUrl}categories.php");
      if(response.statusCode == 200){
        final Map<String, dynamic>? data = response.data;
        if(data != null && data["categories"] != null){
          List<dynamic> categoryList = data["categories"];
          return categoryList.map((dynamic json) => Category.fromJson(json)).toList();
        }
        throw ApiException("No category found", statusCode: response.statusCode);
      }
      throw ApiException("No category found", statusCode: response.statusCode);
    }
    on DioException catch(exception){
      throw ApiException(_handleDioException(exception), statusCode: exception.response?.statusCode);
    }
  }

  // List All Available Ingredients
  Future<List<Ingredient>> fetchAllIngredients() async{
    try{
      final Response<Map<String, dynamic>> response = await _dio.get("${baseUrl}list.php?i=list");
      if(response.statusCode == 200){
        final Map<String, dynamic>? data = response.data;
        if(data != null && data["meals"] != null){
          List<dynamic> ingredients = data["meals"];
          return ingredients.map((dynamic json) => Ingredient.fromJson(json)).toList();
        }
        throw ApiException("No ingredients found", statusCode: response.statusCode);
      }
      throw ApiException("No ingredients found", statusCode: response.statusCode);
    }
    on DioException catch(exception){
      throw ApiException(_handleDioException(exception), statusCode: exception.response?.statusCode);
    }
  }


  String _handleDioException(DioException exception){
    switch(exception.type){
      case DioExceptionType.connectionTimeout:
        return "Connection timeout, please try again later.";
      case DioExceptionType.receiveTimeout:
        return "Server is taking too long to respond.";
      case DioExceptionType.badResponse:
        return "Invalid response from server.";
      case DioExceptionType.cancel:
        return "Request was cancelled.";
      case DioExceptionType.connectionError:
        return "No internet connection.";
      default:
        return "Unexpected error occurred.";
    }
  }

}
