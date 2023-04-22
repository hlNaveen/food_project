import 'package:get/get.dart';

import '../api/api-client.dart';

class TodayProductRep extends GetxService{
  final ApiClient apiClient;
  TodayProductRep({required this.apiClient});

  Future<Response> getTodayProductList() async{
    return await apiClient.getData("/api/v1/products/today"); //create server point

  }
}