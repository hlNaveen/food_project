import 'package:food_app/utility/app_constants.dart';
import 'package:get/get.dart';

import '../api/api-client.dart';

class RecommendedProductRep extends GetxService{
  final ApiClient apiClient;
  RecommendedProductRep({required this.apiClient});

  Future<Response> getrecommendedProductList() async{
    return await apiClient.getData(AppConstants.RECOMENDED_PRODUCT_URI); //create server point

  }
}