import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_app/screen/food/today_food_detail.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../screen/food/rec_food_detail.dart';
import '../screen/home/main_food_page.dart';

class RouteHelp{
  static const String initial="/";
  static const String todayFood="/today-food";
  static const String recommendedFood="/recommended-food";

  static String getInitial()=>'$initial';
  static String getTodayFood(int pageId)=>'$todayFood?pageId=$pageId';
  static String getRecommendedFood(int pageId)=>'$recommendedFood?pageId=$pageId';


  static List<GetPage> routes=[
    GetPage(name: initial, page: ()=>MainFoodPage()),

    GetPage(name:todayFood, page:(){
      var pageId=Get.parameters['pageId'];
      return TodayFoodDetail(pageId:int.parse(pageId!));
    },
      transition: Transition.fade

    ),

    GetPage(name:recommendedFood, page:(){
      var pageId=Get.parameters['pageId'];
      return RecommendedFoodDetail(pageId:int.parse(pageId!));
    },
        transition: Transition.fade

    ),
  ];
}