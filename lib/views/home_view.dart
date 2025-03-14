import 'package:flutter/material.dart';
import 'package:food_app/controllers/meal_controller.dart';
import 'package:food_app/models/meal/meal.dart';
import 'package:food_app/views/meal_detail_view.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  final MealController controller = Get.put(MealController());
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // random meal card
              Obx((){
                if(controller.isLoadingRandomMeal.value){
                  return const Center(child: CircularProgressIndicator());
                }
                else if(controller.errorMessageRandomMeal.isNotEmpty){
                  return Center(child: Text(controller.errorMessage.value, style: const TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold)));
                }
                else{
                  Meal randomMeal = controller.randomMeal.value;
                  return RandomMealCard(randomMeal: randomMeal);
                }
              }),

              const SizedBox(height: 16,),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  const Text("Refresh", textAlign: TextAlign.center,),
                  const SizedBox(width: 16,),
                  InkWell(
                    onTap: () => controller.fetchRandomMeals(),
                    child: const Icon(Icons.refresh, size: 34,),
                  ),
                ]),

              const SizedBox(height: 32,),

              // showing featured meals
              const Text("Featured Meals", style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),),

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
                      itemCount: controller.meals.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (_, int index){
                        final Meal meal = controller.meals[index];
                        return ListTile(
                          title: Text(meal.strMeal ?? "No Meal"),
                          subtitle: Text(meal.strCategory ?? "No Category"),
                          leading: Image.network(meal.strMealThumb ?? "",),
                          trailing: const Icon(Icons.navigate_next),
                          onTap: () => Get.to(() => MealDetailView(), arguments: meal.idMeal),
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

class RandomMealCard extends StatelessWidget {
  const RandomMealCard({
    super.key,
    required this.randomMeal,
  });

  final Meal randomMeal;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Image.network(randomMeal.strMealThumb ?? "", width: 200, height: 200,),
          Flexible(
            child: ListTile(
              title: Text(randomMeal.strMeal ?? "No Meal", style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(randomMeal.strCategory ?? "No Category"),
                  const SizedBox(height: 8,),
                  const Text("Random meal"),
                ],
              ),
              onTap: () {
                //TODO Handle tap to show details (for example)
              },
            ),
          ),
        ],
      ),
    );
  }
}
