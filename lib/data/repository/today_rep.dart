import 'package:get/get.dart';

import '../api/api_client.dart';

class TodayProduactRep extends GetxService{
  final ApiClient apiClient;
  TodayProduactRep({required this.apiClient});

  Future<Response> getTodayProductList() async{
    return await apiClient.getData("end Point url");
  }
}