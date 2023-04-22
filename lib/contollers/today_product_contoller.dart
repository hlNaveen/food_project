import 'package:food_app/data/reposotory/today_pro_rep.dart';
import 'package:get/get.dart';

import '../model/today_product_model.dart';

class TodayProductController extends GetxController {
  final TodayProductRep todayProductRep;
  TodayProductController({required this.todayProductRep});
  List<ProductModel> _todayProductList=[];
  List<ProductModel> get todayProductList => _todayProductList;

  bool _isLoaded = false;
  bool get isLoaded =>_isLoaded;

  Future<void> getTodayProductList()async{
    Response response = await todayProductRep.getTodayProductList();
    if(response.statusCode==200){

      print("got products");
      _todayProductList=[];
      _todayProductList.addAll(Product.fromJson(response.body).products);
      //print(_todayProductList);
      _isLoaded=true;
      update();
    }else{

    }
  }

}