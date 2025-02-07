import 'package:flutter/material.dart';
import 'package:food_app/controllers/bottom_navigation_controller.dart';
import 'package:get/get.dart';

class BottomNavigationView extends StatelessWidget {
  final BottomNavigationController controller = Get.put(BottomNavigationController());
  BottomNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Meal App", style: TextStyle(color: Colors.white),), backgroundColor: Colors.blue,),
        body: PageView(
          controller: controller.pageController,
          onPageChanged: controller.onScreenChangedBySwipe,
          children: controller.pages
        ),
        bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: controller.selectedIndex.value,
            onTap: (int index) => controller.onScreenChangedByTap(index),
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            items: <BottomNavigationBarItem>[
              const BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
              const BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
              const BottomNavigationBarItem(icon: Icon(Icons.category_rounded), label: "Category"),
              const BottomNavigationBarItem(icon: Icon(Icons.more_horiz_outlined), label: "More"),
            ]
        ),)
    );
  }
}
