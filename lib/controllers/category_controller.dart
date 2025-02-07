import 'package:food_app/models/category/category.dart';
import 'package:food_app/services/api_services.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController{
  final ApiServices _apiServices = ApiServices();

  RxList<Category> categories = <Category>[].obs;
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  void fetchCategories() async{
    try{
      isLoading.value = true;
      errorMessage.value = "";
      final List<Category> categoryList = await _apiServices.fetchALlCategories();
      categories.value = categoryList;
    }
    catch(exception){
      errorMessage.value = exception.toString();
    }
    finally{
      isLoading.value = false;
    }
  }

}