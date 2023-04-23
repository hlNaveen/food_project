import 'package:food_app/data/reposotory/today_pro_rep.dart';
import 'package:get/get.dart';

import '../data/reposotory/recomended_pro_rep.dart';
import '../model/today_product_model.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRep recommendedProductRep;
  RecommendedProductController({required this.recommendedProductRep});
  List<ProductModel> _recommendedProductList=[];
  List<ProductModel> get recommendedProductList => _recommendedProductList;

  bool _isLoaded = false;
  bool get isLoaded =>_isLoaded;

  Future<void> getRecommendedProductList()async{
    Response response = await recommendedProductRep.getrecommendedProductList();
    if(response.statusCode==200){

      _recommendedProductList=[];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      //print(_todayProductList);
      _isLoaded=true;
      update();
    }else{
      print("could not get");
    }
  }

}