import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/contollers/cart_controller.dart';
import 'package:food_app/utility/app_constants.dart';
import 'package:food_app/widgets/app_column.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:food_app/widgets/expanable_text_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../contollers/today_product_contoller.dart';
import '../../utility/dimention.dart';
import '../../widgets/app_icon.dart';
import '../home/main_food_page.dart';

class TodayFoodDetail extends StatelessWidget {
  int pageId;
  TodayFoodDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product= Get.find<TodayProductController>().todayProductList[pageId];
    Get.find<TodayProductController>().initProduct(product,Get.find<CartController>());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [

          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.TodayFoodImageSize,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      AppConstants.BASE_URL+AppConstants.UPLOAD_URL+product.img!
                    )

                  )),
            ),
          ),

          Positioned(
              top: Dimensions.height45,
              left: Dimensions.width10,
              right: Dimensions.width10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap:(){
                      Get.to(()=>MainFoodPage());

          },
                      child:
                  AppIcon(icon:Icons.arrow_back_rounded)),
                  AppIcon(icon:Icons.shopping_cart_outlined),
                ],
              )),

          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.TodayFoodImageSize-20,
            child: Container(

              padding: EdgeInsets.only(
                left: Dimensions.width10,
                right: Dimensions.width10,
                top: Dimensions.height20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius20),
                    topLeft: Radius.circular(Dimensions.radius20,)),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(text:product.name!),
                  SizedBox(height: Dimensions.height20,),
                  BigText(text: "about"),
                  SizedBox(height: Dimensions.height20,),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableTextWidget(
                          text:product.description!),
                    ),
                  )
                ],
              ),
            ),),
        ],
      ),
      bottomNavigationBar: GetBuilder<TodayProductController>(builder: (todayProduct){
        return Container(
          height: Dimensions.bottomHeightBar,
          padding: EdgeInsets.only(top:Dimensions.height30, bottom: Dimensions.height30, left: Dimensions.width10, right: Dimensions.width10),
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius20*2),
                topRight: Radius.circular(Dimensions.radius20*2),
              )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width10, right: Dimensions.width10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white
                ),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: (){
                          todayProduct.setQuantity(false);
                        },
                        child: Icon(Icons.remove, color: Colors.black,)),
                    SizedBox(width: Dimensions.width20,),
                    BigText(text: todayProduct.inCartItem.toString()),
                    SizedBox(width: Dimensions.width20,),
                    GestureDetector(
                        onTap: (){
                          todayProduct.setQuantity(true);
                        },
                        child: Icon(Icons.add, color: Colors.black,))
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width10,right: Dimensions.width10),

                child: GestureDetector(
                  onTap: (){
                    todayProduct.addItem(product);
                  },
                    child: BigText(text: "\Rs. ${product.price!} | Add to cart", color: Colors.white,)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular((Dimensions.radius20),),
                  color: Colors.green,
                ),
              ),
            ],
          ),
        );
      },),
    );
  }
}
