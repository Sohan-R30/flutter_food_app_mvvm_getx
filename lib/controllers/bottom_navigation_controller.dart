import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/views/category_view.dart';
import 'package:food_app/views/home_view.dart';
import 'package:food_app/views/ingredient_meal_view.dart';
import 'package:food_app/views/search_meal_view.dart';
import 'package:get/get.dart';

class BottomNavigationController extends GetxController{
  RxInt selectedIndex = 0.obs;
  final PageController pageController = PageController();

  final List<Widget> pages = [
    HomeView(),
    SearchMealView(),
    CategoryView(),
    IngredientMealView(),
  ];

  void onScreenChangedBySwipe(int index){
    selectedIndex.value = index;
  }

  void onScreenChangedByTap(int index){
    selectedIndex.value = index;
    pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

}