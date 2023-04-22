import 'package:flutter/material.dart';
import 'package:food_app/contollers/today_product_contoller.dart';
import 'package:food_app/screen/admin/adminhome.dart';
import 'package:food_app/screen/food/rec_food_detail.dart';
import 'package:food_app/screen/food/today_food_detail.dart';
import 'package:food_app/screen/home/main_food_page.dart';
import 'package:get/get.dart';
import 'help/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    Get.find<TodayProductController>().getPopularProduct();
    return GetMaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RecomendedFoodDetail(),
    );
  }
}