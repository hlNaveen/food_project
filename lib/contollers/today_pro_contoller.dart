import 'package:get/get.dart';

import '../data/repository/today_rep.dart';

class TodayProductController extends GetxController{
  final TodayProduactRep todayProduactRep;
  TodayProductController({required this.todayProduactRep});
  List<dynamic> _todayProductList=[];
  List<dynamic> get todayProductList =>_todayProductList;

  Future<void> getTodayProductList()async{
    Response response = await todayProduactRep.getTodayProductList();
    if(response.statusCode==200){
      _todayProductList=[];
      //_todayProductList.addAll();//data
      update();
    }
    else{

    }
  }

}