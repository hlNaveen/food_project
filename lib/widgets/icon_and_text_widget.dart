import 'package:flutter/cupertino.dart';
import 'package:food_app/widgets/small_text.dart';

import '../utility/dimention.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final text;
  final Color iconColor;
  const IconAndTextWidget({Key? key,
    required this.icon,
    required this.text,
    required this.iconColor}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: Dimensions.iconSize25,),
        SizedBox(width: 5,),
        SmallText(text: text),
      ],
    );
  }
}
