import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/widgets/small_text.dart';

import '../utility/dimention.dart';
import 'big_text.dart';
import 'icon_and_text_widget.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: Dimensions.height15,left: Dimensions.width10,right: Dimensions.width10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigText(text: text, size: Dimensions.font26),
          SizedBox(height: Dimensions.height10,),
          Row(
            children: [
              Wrap(
                children:
                List.generate(5, (index) => Icon(Icons.star,color: Colors.red,)),
              ),
              SizedBox(width: Dimensions.width10,),
              SmallText(text: "5"),

            ],
          ),
          SizedBox(height: Dimensions.height10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconAndTextWidget(icon: Icons.person,
                  text: "1 Person",
                  iconColor: Colors.yellow),
              SizedBox(width: 10,),
              SmallText(text: "Rs.450.00/=", color: Colors.black54,)
            ],
          ),
        ],
      ),
    );
  }
}
