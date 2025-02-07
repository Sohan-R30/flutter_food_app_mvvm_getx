import 'package:flutter/material.dart';
import 'package:food_app/controllers/meal_detail_controller.dart';
import 'package:get/get.dart';

class MealDetailView extends StatelessWidget {
  final MealDetailSController controller = Get.put(MealDetailSController());
  MealDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Obx(() => Text(
                controller.meal.value.strMeal ?? "No Meal",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),),
              ),
              background:  Obx(() => controller.meal.value.strMealThumb != null ? Image.network(
                controller.meal.value.strMealThumb!,
                fit: BoxFit.cover,
              ) : const Icon(Icons.image_not_supported)) ,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  /// **Category & Area**
                  Row(
                    children: <Widget>[
                      Chip(
                        label: Obx(() => Text(controller.meal.value.strCategory ?? "Unknown")),
                        backgroundColor: Colors.blue.withValues(alpha: 0.2),
                      ),
                      const SizedBox(width: 8),
                      Chip(
                        label:  Obx(() => Text(controller.meal.value.strArea ?? "Unknown")),
                        backgroundColor: Colors.green.withValues(alpha: 0.2),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  /// **Tags**
                  if (controller.meal.value.strTags != null && controller.meal.value.strTags!.isNotEmpty) ...<Widget>[
                    const Text(
                      "Tags:",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Wrap(
                      spacing: 8,
                      children: controller.meal.value.strTags!.split(",").map((String tag) {
                        return Chip(
                          label: Obx(() => Text(tag.trim())),
                          backgroundColor: Colors.orange.withValues(alpha: 0.2)
                        );
                      }).toList(),
                    ),
                  ],

                  const SizedBox(height: 15),

                  /// **Ingredients**
                  if (controller.meal.value.ingredients != null && controller.meal.value.ingredients!.isNotEmpty) ...<Widget>[
                    const Text(
                      "Ingredients",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(height: 5),
                    ...controller.meal.value.ingredients!.map(
                      (String ingredient) => ListTile(
                        leading: const Icon(Icons.circle_outlined),
                        title: Obx(() => Text(ingredient)),
                      ),
                    ),
                  ],

                  const SizedBox(height: 15),

                  /// **Instructions**
                  const Text(
                    "Instructions",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 5),
                  Obx(() =>  Text(
                    controller.meal.value.strInstructions ?? "No instructions available.",
                    style: const TextStyle(fontSize: 16, height: 1.5),
                  )),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
