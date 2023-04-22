import 'package:flutter/material.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:food_app/widgets/expanable_text_widget.dart';

import '../../utility/dimention.dart';
import '../../widgets/app_icon.dart';

class RecomendedFoodDetail extends StatelessWidget {
  const RecomendedFoodDetail({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart)
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                child: Center(child: BigText(size:Dimensions.font26, text: "Chicken Fried Rice")),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 10, bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius20),
                    topLeft: Radius.circular(Dimensions.radius20),
                    //bottomLeft: Radius.circular(Dimensions.radius20),
                    //bottomRight: Radius.circular(Dimensions.radius20),

                  )
                ),
              ),
            ),
            pinned: true,
            backgroundColor: Colors.lightGreen,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset("assets/images/fried-rice.jpeg",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  child: ExpandableTextWidget(text: "One fried rice suit for 1 person.with devilled chicken make with delicious special sources.And chili paste make it even tastier."),
                margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: Dimensions.width20*2,
              right: Dimensions.width20*2,
              top: Dimensions.height10,
              bottom: Dimensions.height10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                    iconSize: Dimensions.font26,
                    iconColor:Colors.black, backgroundColor:Colors.blueGrey, icon: Icons.remove),
                BigText(text: "\Rs 450 "+" X "+" 0",color: Colors.black,size: Dimensions.font26),
                AppIcon(iconSize: Dimensions.font26,
                    iconColor:Colors.black, backgroundColor:Colors.blueGrey, icon: Icons.add)
              ],
            ),
          ),
          Container(
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
                  padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white
                  ),
                  child: Icon(
                    Icons.favorite,
                    color: Colors.blueGrey,
                    size: 25,
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
        ],
      ),
    );
  }
}