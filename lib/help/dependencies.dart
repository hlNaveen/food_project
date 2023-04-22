import 'package:food_app/contollers/today_product_contoller.dart';
import 'package:food_app/data/reposotory/today_pro_rep.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../data/api/api-client.dart';

Future<void> init()async {
  //apiclient
  Get.lazyPut(()=>ApiClient(appBaseUrl: ""));//anything website

  //rep
  Get.lazyPut(() => TodayProductRep(apiClient: Get.find()));

  //contoller
  Get.lazyPut(() => TodayProductController(todayProductRep: Get.find()));
}