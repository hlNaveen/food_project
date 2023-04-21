import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/widgets/app_column.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:food_app/widgets/expanable_text_widget.dart';

import '../../utility/dimention.dart';
import '../../widgets/app_icon.dart';

main(){
  runApp(TodayFoodDetail());
}

class TodayFoodDetail extends StatelessWidget {
  const TodayFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    image: AssetImage(
                        "assets/images/fried-rice.jpeg"),

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
                  AppIcon(icon:Icons.arrow_back_rounded),
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
                  AppColumn(text: "Fried Rice"),
                  SizedBox(height: Dimensions.height20,),
                  BigText(text: "about"),
                  SizedBox(height: Dimensions.height20,),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableTextWidget(
                          text:
                          "One fried rice suit for 1 person.with devilled chicken make with delicious special sources.And chili paste make it even tastier."),
                    ),
                  )
                ],
              ),
            ),),
        ],
      ),
      bottomNavigationBar: Container(
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
                  Icon(Icons.remove, color: Colors.black,),
                  SizedBox(width: Dimensions.width20,),
                  BigText(text: "0"),
                  SizedBox(width: Dimensions.width20,),
                  Icon(Icons.add, color: Colors.black,),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width10,right: Dimensions.width10),

              child: BigText(text: "\Rs.450 | Add to cart", color: Colors.white,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular((Dimensions.radius20),),
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
