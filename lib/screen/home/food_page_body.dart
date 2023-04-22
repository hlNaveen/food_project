import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/contollers/today_product_contoller.dart';
import 'package:food_app/model/today_product_model.dart';
import 'package:food_app/routes/route_help.dart';
import 'package:food_app/screen/food/today_food_detail.dart';
import 'package:food_app/widgets/app_column.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:food_app/widgets/icon_and_text_widget.dart';
import 'package:food_app/widgets/small_text.dart';
import 'package:get/get.dart';

import '../../contollers/recomended_pro_controller.dart';
import '../../utility/app_constants.dart';
import '../../utility/dimention.dart';

class FoodPageBody extends StatefulWidget {

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController =PageController(viewportFraction: 0.85);
  var _currPageValue=0.0;
  double _scaleFactor=0.8;
  double _height=Dimensions.pageViewContainer;

  @override
  void initState(){
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue= pageController.page!;

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<TodayProductController>(builder:(todayProducts){
          return Container(
            height: Dimensions.pageView,

              child: PageView.builder(
                  controller: pageController,
                  itemCount: 4,
                  itemBuilder: (context,position){
                    return _buildPageItem(position,todayProducts.todayProductList[position]);
                  }),

          );
        }),

        GetBuilder<TodayProductController>(builder: (todayProducts){
          return DotsIndicator(
            dotsCount: 4,
            position: _currPageValue,
            decorator: DotsDecorator(
              activeColor: Colors.blue,
              size: Size.square(9.0),
              activeSize: Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),
        SizedBox(height: Dimensions.height30,),

        Container(
          margin: EdgeInsets.only(left: Dimensions.width10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Today"),
              SizedBox(width: Dimensions.width10,),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(text: "Special",),
              ),
            ],
          ),
        ),

        GetBuilder<RecommendedProductController>(builder: (recommendedProduct){
          return recommendedProduct.isLoaded?ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index){
                return GestureDetector(
                  onTap: (){
                    Get.toNamed(RouteHelp.getRecommendedFood());
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        left: Dimensions.width10, right: Dimensions.width10, bottom: Dimensions.height15),

                    child: Row(
                      children: [

                        Container(
                          width:Dimensions.listviewImgSize,
                          height: Dimensions.listviewImgSize,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.radius20),
                            color: Colors.white,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                              image: NetworkImage(
                                  AppConstants.BASE_URL+AppConstants.UPLOAD_URL+recommendedProduct.recommendedProductList[index].img!
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: Dimensions.listviewTextContSize,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(Dimensions.radius20),
                                  bottomRight: Radius.circular(Dimensions.radius20),
                                ),
                                color: Colors.white
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  BigText(text: recommendedProduct.recommendedProductList[index].name!),
                                  SizedBox(height: Dimensions.height20,),

                                  SmallText(text: "Special Ingredients"),
                                  SizedBox(width: Dimensions.width10,),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconAndTextWidget(icon: Icons.person,
                                          text: "1 Person",
                                          iconColor: Colors.yellow),
                                      SizedBox(width: 2,),
                                      SmallText(text: "Rs.450.00",),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }):CircularProgressIndicator(
            color: Colors.blueGrey,
          );
        })
      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel todayProductList){
    Matrix4 matrix = new Matrix4.identity();
    if(index==_currPageValue.floor()){
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    }else if(index ==_currPageValue.floor()+1){
      var currScale = _scaleFactor+(_currPageValue-index+1)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }
    else if(index ==_currPageValue.floor()-1) {
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    }
    else{
      var currScale=0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor), 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
          onTap: (){
            Get.toNamed(RouteHelp.getTodayFood(index));

            },
            child: Container(
              height: Dimensions.pageViewContainer,
              margin:  EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: index.isEven?Color(0xFF69c5df):Color(0XFF9294cc),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    AppConstants.BASE_URL+AppConstants.UPLOAD_URL+todayProductList.img!
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(left: Dimensions.width10/2, right: Dimensions.width30*2,bottom: Dimensions.height10*5,),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color:Color(0xFFe8e8e8),
                        blurRadius: 5.0,
                        offset: Offset(0, 5)
                    ),
                    BoxShadow(color: Colors.white,
                        offset: Offset(-5, 0)
                    ),
                    BoxShadow(color: Colors.white,
                        offset: Offset(5, 0)
                    ),
                  ]
              ),
              child: AppColumn(text: todayProductList.name!),
            ),
          ),
        ],
      ),
    );
  }
}
