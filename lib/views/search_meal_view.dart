import 'package:flutter/material.dart';
import 'package:food_app/controllers/search_meal_controller.dart';
import 'package:food_app/models/meal/meal.dart';
import 'package:food_app/views/meal_detail_view.dart';
import 'package:get/get.dart';

class SearchMealView extends StatelessWidget {

  final SearchMealController controller = Get.put(SearchMealController());
  SearchMealView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // search bar
              TextField(
                controller: controller.textEditingController,
                decoration: InputDecoration(
                    hintText: "Search for meals...",
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0)
                    )
                ),
                onChanged: controller.fetchSearchMeals,
              ),

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
                    child: ListView.builder(
                        itemCount: controller.searchMeals.length,
                        itemBuilder: (_, int index){
                          final Meal meal = controller.searchMeals[index];
                          return ListTile(
                            title: Text(meal.strMeal ?? "No Meals"),
                            subtitle: Text(meal.strCategory ?? "No Category"),
                            leading: Image.network(meal.strMealThumb ?? "",),
                            trailing: const Icon(Icons.navigate_next),
                            onTap: () => Get.to(() => MealDetailView(), arguments: meal.idMeal),
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
