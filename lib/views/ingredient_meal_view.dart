import 'package:flutter/material.dart';
import 'package:food_app/controllers/ingredients_meal_controller.dart';
import 'package:food_app/models/ingredient/ingredient.dart';
import 'package:get/get.dart';

class IngredientMealView extends StatelessWidget {
  final IngredientsMealController controller = Get.put(IngredientsMealController());
  IngredientMealView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              const SizedBox(height: 16),

              const Text("Featured Ingredients", style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),),

              const SizedBox(height: 16),

              Obx(() {
                if(controller.isLoading.value){
                  return const Center(child: CircularProgressIndicator(),);
                }
                else if(controller.errorMessage.value.isNotEmpty){
                  return Center(child: Text(controller.errorMessage.value, style: const TextStyle(fontSize: 22, color: Colors.red, fontWeight: FontWeight.bold),));
                }
                else{
                  return Expanded(
                    flex: 1,
                    child: ListView.builder(
                        itemCount: controller.ingredients.length,
                        itemBuilder: (_, int index){
                          final Ingredient ingredient = controller.ingredients[index];
                          return ListTile(
                            title: Text(ingredient.strIngredient ?? "No Ingredients", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                            subtitle: Text(ingredient.strDescription ?? "No Description"),
                          );
                        }
                    ),
                  );
                }
              })
            ],
          ),
      ),
    );
  }
}
