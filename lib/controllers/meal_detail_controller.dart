import 'package:food_app/models/meal/meal.dart';
import 'package:food_app/services/api_services.dart';
import 'package:get/get.dart';

class MealDetailSController extends GetxController{
  final ApiServices _apiServices = ApiServices();

  Rx<Meal> meal = Meal().obs;
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    final dynamic arguments = Get.arguments;
    if (arguments is String) {
      fetchMealDetails(arguments);
    } else {
      errorMessage.value = "Invalid meal!";
    }
  }

  void fetchMealDetails(String mealId) async{
    try{
      isLoading.value = true;
      errorMessage.value = "";
      final Meal mealDetail = await _apiServices.fetchMealDetails(mealId);
      meal.value = mealDetail;
    }
    catch(exception){
      errorMessage.value = exception.toString();
    }
    finally{
      isLoading.value = false;
    }
  }
}