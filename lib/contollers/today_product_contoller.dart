import 'package:flutter/material.dart';
import 'package:food_app/contollers/cart_controller.dart';
import 'package:food_app/data/reposotory/today_pro_rep.dart';
import 'package:get/get.dart';

import '../model/today_product_model.dart';

class TodayProductController extends GetxController {
  final TodayProductRep todayProductRep;
  TodayProductController({required this.todayProductRep});
  List<ProductModel> _todayProductList=[];
  List<ProductModel> get todayProductList => _todayProductList;
  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded =>_isLoaded;

  int _quantity=0;
  int get quantity=>_quantity;
  int _inCartItems=0;
  int get inCartItem=>_inCartItems+_quantity;

  Future<void> getTodayProductList()async{
    Response response = await todayProductRep.getTodayProductList();
    if(response.statusCode==200){

      _todayProductList=[];
      _todayProductList.addAll(Product.fromJson(response.body).products);

      _isLoaded=true;
      update();
    }else{

    }
  }

  void setQuantity(bool isIncrement){
    if(isIncrement){
      print("increement"+quantity.toString());
      _quantity = checkQuantity (_quantity+1);
    }else{
      _quantity = checkQuantity (_quantity-1);
      print("decrement"+_quantity.toString());
    }
    update();
  }
  int checkQuantity(int quantity){
    if(quantity<0){
      Get.snackbar("Item count", "can't reduce",
      backgroundColor: Colors.blueGrey,
      colorText: Colors.white
      );
      return 0;
    }else if(quantity>20){
      Get.snackbar("Item count", "can't add",
          backgroundColor: Colors.blueGrey,
          colorText: Colors.white
      );
      return 20;
    }else{
      return quantity;
    }
  }

  void initProduct(ProductModel product, CartController cart){
    _quantity=0;
    _inCartItems=0;
    _cart=cart;
    var exist=false;
    exist = _cart.existInCart(product);

    //if exist
    //get from storage _inCartItems=3
    print("exist or not"+exist.toString());
    if(exist){
      _inCartItems=_cart.getQuantity(product);
    }
    print("the quantity"+_inCartItems.toString());
  }

  void addItem(ProductModel product ){
    if(_quantity>0){
      _cart.addItem(product, quantity);
      _quantity=0;
      _cart.items.forEach((key, value){
        print("the id "+value.id.toString()+"the quantity is"+value.quantity.toString());
      });

    }else{
      Get.snackbar("Item count", "add at least 1 item",
          backgroundColor: Colors.blueGrey,
          colorText: Colors.white
      );
    }

  }
}