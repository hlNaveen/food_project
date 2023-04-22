import 'package:food_app/utility/app_constants.dart';
import 'package:get/get.dart';

import '../api/api-client.dart';

class TodayProductRep extends GetxService{
  final ApiClient apiClient;
  TodayProductRep({required this.apiClient});

  Future<Response> getTodayProductList() async{
    return await apiClient.getData(AppConstants.BASE_URL); //create server point

  }
}