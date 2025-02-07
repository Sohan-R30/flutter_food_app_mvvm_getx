import 'package:food_app/models/simple_meal/simple_meal.dart';
import 'package:food_app/services/api_services.dart';
import 'package:get/get.dart';

class MealsByCategoryController extends GetxController{
  final ApiServices _apiServices = ApiServices();

  RxList<SimpleMeal> mealsByCategory = <SimpleMeal>[].obs;
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    final dynamic arguments = Get.arguments;
    if (arguments is String) {
      fetchCategories(arguments);
    } else {
      errorMessage.value = "Invalid category!";
    }
  }

  void fetchCategories(String category) async{
    try{
      isLoading.value = true;
      errorMessage.value = "";
      final List<SimpleMeal> mealList = await _apiServices.fetchMealsByCategory(category);
      mealsByCategory.value = mealList;
    }
    catch(exception){
      errorMessage.value = exception.toString();
    }
    finally{
      isLoading.value = false;
    }
  }


}