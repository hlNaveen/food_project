import 'package:food_app/contollers/today_product_contoller.dart';
import 'package:food_app/data/reposotory/today_pro_rep.dart';
import 'package:food_app/utility/app_constants.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../contollers/recomended_pro_controller.dart';
import '../data/api/api-client.dart';
import '../data/reposotory/recomended_pro_rep.dart';

Future<void> init()async {
  //apiclient
  Get.lazyPut(()=>ApiClient(appBaseUrl: AppConstants.BASE_URL));//anything website

  //rep
  Get.lazyPut(() => TodayProductRep(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRep(apiClient: Get.find()));

  //contoller
  Get.lazyPut(() => TodayProductController(todayProductRep: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRep: Get.find()));
}