import 'package:flutter/material.dart';
import 'package:food_app/screen/admin/adminhome.dart';
import 'package:food_app/screen/food/today_food_detail.dart';
import 'package:food_app/screen/home/main_food_page.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: Admin(),
    );
  }
}