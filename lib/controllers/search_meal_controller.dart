import 'package:flutter/cupertino.dart';
import 'package:food_app/models/meal/meal.dart';
import 'package:food_app/services/api_services.dart';
import 'package:get/get.dart';

class SearchMealController extends GetxController{
  final ApiServices _apiServices = ApiServices();
  TextEditingController textEditingController = TextEditingController();

  final RxList<Meal> searchMeals = <Meal>[].obs;
  final RxBool isLoading = false.obs;
  final RxString errorMessage = "".obs;

  @override
  void onInit() {
    super.onInit();
    fetchSearchMeals("");
  }

  void fetchSearchMeals(String query) async{
    try{
      isLoading.value = true;
      errorMessage.value = "";
      final List<Meal> meals = await _apiServices.searchMeals(query);
      searchMeals.value = meals;
    }
    catch(exception){
      errorMessage.value = exception.toString();
    }
    finally{
      isLoading.value = false;
    }
  }


}