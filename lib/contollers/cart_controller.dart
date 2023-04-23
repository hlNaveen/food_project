import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../data/reposotory/cart_rep.dart';
import '../model/cart_model.dart';
import '../model/today_product_model.dart';

class CartController extends GetxController{
  final CartRep cartRep;
  CartController({required this.cartRep});
  Map<int, CartModel> _items={};

  Map<int, CartModel>get items=> _items;

  void addItem(ProductModel product, int quantity){
    if(_items.containsKey(product.id!)){
      _items.update(product.id!, (value) {
        return CartModel(
          id: value.id, name: value.name, price: value.price, img: value.img, quantity: value.quantity!+quantity, isExit: true, time: DateTime.now().toString(),
        );
      });

    }else{
      _items.putIfAbsent(product.id!, () {

        return CartModel(
          id: product.id, name: product.name, price: product.price, img: product.img, quantity: quantity, isExit: true, time: DateTime.now().toString(),
        );}
      );
    }

  }

  bool existInCart(ProductModel product){
    if(_items.containsKey(product.id)){
      return true;
    }
    return false;
  }

  getQuantity(ProductModel product){
    var quantity=0;
    if(_items.containsKey(product.id)){
      _items.forEach((key, value){
        if(key==product.id){
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }
}