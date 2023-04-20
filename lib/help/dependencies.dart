import 'package:food_app/data/api/api_client.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../contollers/today_pro_contoller.dart';
import '../data/repository/today_rep.dart';

Future<void> init()async {

  Get.lazyPut(()=>ApiClient(appBaseUrl: "url"));//api client

  Get.lazyPut(()=>TodayProduactRep(apiClient:Get.find()));//rep

  Get.lazyPut(()=>TodayProductController(todayProduactRep:Get.find()));//controller
}