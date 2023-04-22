import 'package:flutter/material.dart';
import 'package:food_app/contollers/today_product_contoller.dart';
import 'package:food_app/routes/route_help.dart';
import 'package:food_app/screen/admin/adminhome.dart';
import 'package:food_app/screen/food/rec_food_detail.dart';
import 'package:food_app/screen/food/today_food_detail.dart';
import 'package:food_app/screen/home/food_page_body.dart';
import 'package:food_app/screen/home/main_food_page.dart';
import 'package:get/get.dart';
import 'contollers/recomended_pro_controller.dart';
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
    Get.find<TodayProductController>().getTodayProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      home: MainFoodPage(),
      initialRoute: RouteHelp.initial,
      getPages: RouteHelp.routes,
    );
  }
}
class _HomePageState extends StatefulWidget {
  const _HomePageState({Key? key}) : super(key: key);

  @override
  State<_HomePageState> createState() => _HomePageStateState();
}

class _HomePageStateState extends State<_HomePageState> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
