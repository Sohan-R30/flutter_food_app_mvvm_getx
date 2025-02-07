import 'package:flutter/material.dart';
import 'package:food_app/controllers/category_controller.dart';
import 'package:food_app/models/category/category.dart';
import 'package:food_app/models/meal/meal.dart';
import 'package:food_app/views/meals_by_category.dart';
import 'package:get/get.dart';

class CategoryView extends StatelessWidget {
  final CategoryController controller = Get.put(CategoryController());
  CategoryView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 16,),
          
              // showing featured meals
              const Text("Featured Categories", style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),),
          
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
                      itemCount: controller.categories.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (_, int index){
                        final Category category = controller.categories[index];
                        return ListTile(
                          title: Text(category.strCategory),
                          subtitle: Text(category.strCategoryDescription.length > 50 == true ? category.strCategoryDescription.substring(0, 50)[0] : category.strCategoryDescription),
                          leading: Image.network(category.strCategoryThumb,),
                          trailing: const Icon(Icons.navigate_next),
                          onTap: (){
                            Get.to(() => MealsByCategoryView(), arguments: category.strCategory);
                          });
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
