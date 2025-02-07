import 'package:flutter/cupertino.dart';
import 'package:food_app/models/ingredient/ingredient.dart';
import 'package:food_app/models/meal/meal.dart';
import 'package:food_app/services/api_services.dart';
import 'package:get/get.dart';

class IngredientsMealController extends GetxController{
  final ApiServices _apiServices = ApiServices();
  TextEditingController textEditingController = TextEditingController();

  final RxList<Ingredient> ingredients = <Ingredient>[].obs;
  final RxBool isLoading = false.obs;
  final RxString errorMessage = "".obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllIngredients();
  }

  void fetchAllIngredients() async{
    try{
      isLoading.value = true;
      errorMessage.value = "";
      final List<Ingredient> meals = await _apiServices.fetchAllIngredients();
      ingredients.value = meals;
    }
    catch(exception){
      errorMessage.value = exception.toString();
    }
    finally{
      isLoading.value = false;
    }
  }


}