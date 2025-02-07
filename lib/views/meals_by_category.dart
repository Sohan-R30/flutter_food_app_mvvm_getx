import 'package:flutter/material.dart';
import 'package:food_app/controllers/meals_by_category.dart';
import 'package:food_app/models/simple_meal/simple_meal.dart';
import 'package:food_app/views/meal_detail_view.dart';
import 'package:get/get.dart';

class MealsByCategoryView extends StatelessWidget {
  MealsByCategoryView({super.key});
  final MealsByCategoryController controller = Get.put(MealsByCategoryController());

  @override
  Widget build(BuildContext context) {

    String categoryName = "";

    final dynamic arguments = Get.arguments;
    if (arguments is String) {
      categoryName = arguments;
    } else {
      categoryName = "Invalid category!";
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Meal App", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        leading: GestureDetector(onTap: Get.back,child: const Icon(Icons.arrow_back_ios, color: Colors.white,),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // category  card

              const SizedBox(height: 8,),

              // showing featured meals
              Text("Category : $categoryName", style: const TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),),

              const SizedBox(height: 16,),

              Obx((){
                if(controller.isLoading.value){
                  return const Center(child: CircularProgressIndicator());
                }
                else if(controller.errorMessage.value.isNotEmpty){
                  return Center(child: Text(controller.errorMessage.value, style: const TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold)));
                }
                else{
                  return ListView.builder(
                      itemCount: controller.mealsByCategory.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (_, int index){
                        final SimpleMeal meal = controller.mealsByCategory[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ListTile(
                            title: Text(meal.strMeal),
                            leading: Image.network(meal.strMealThumb),
                            trailing: const Icon(Icons.navigate_next),
                            onTap: () => Get.to(() => MealDetailView(), arguments: meal.idMeal),
                          ),
                        );
                      }
                  );
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
