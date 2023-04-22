import 'package:food_app/data/reposotory/today_pro_rep.dart';
import 'package:get/get.dart';

import '../model/today_product_model.dart';

class TodayProductController extends GetxService{
  final TodayProductRep todayProductRep;
  TodayProductController({required this.todayProductRep});
  List<dynamic> _todayProductList=[];
  List<dynamic> get todayroductList => _todayProductList;

  Future<void> getPopularProduct()async{
    Response response = await todayProductRep.getTodayProductList();
    if(response.statusCode==200){

      _todayProductList=[];
      _todayProductList.addAll(Product.fromJson(response.body).products);
      print(_todayProductList);
      update();
    }else{

    }
  }

  void update() {}

}