import 'package:food_app/models/meal/meal.dart';
import 'package:food_app/services/api_services.dart';
import 'package:get/get.dart';

class MealController extends GetxController{
  final ApiServices _apiServices = ApiServices();

  final RxList<Meal> meals = <Meal>[].obs;
  final Rx<Meal> randomMeal = Meal().obs;

  RxBool isLoading = false.obs;
  RxBool isLoadingRandomMeal = false.obs;
  RxString errorMessageRandomMeal = ''.obs;
  RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchRandomMeals();
    fetchAllMeals();
  }

  void fetchAllMeals() async{
    try{
      isLoading.value = true;
      errorMessage.value = "";
      final List<Meal> mealList = await _apiServices.fetchAllMeals();
      meals.value = mealList;
    }
    catch(exception){
      errorMessage.value = exception.toString();
    }
    finally {
      isLoading.value = false;
    }
  }

  void fetchRandomMeals() async{
    try{
      isLoadingRandomMeal.value = true;
      errorMessageRandomMeal.value = "";
      final Meal random = await _apiServices.fetchRandomMeal();
      randomMeal.value = random;
    }
    catch(exception){
      errorMessageRandomMeal.value = exception.toString();
    }
    finally{
      isLoadingRandomMeal.value = false;
    }

  }
}