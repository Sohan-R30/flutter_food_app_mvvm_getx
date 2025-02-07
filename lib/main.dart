import 'package:flutter/material.dart';
import 'package:food_app/views/bottom_navigation_view.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meal App',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: BottomNavigationView(),
    );
  }
}