import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:velocity_x/velocity_x.dart';

class no_holiday extends StatelessWidget {
  no_holiday({Key? key,required this.img_svg,required this.img_size,required this.warning_txt,
    required this.text_color,required this.text_size}) : super(key: key);
  var warning_txt,text_color,img_svg,text_size,img_size;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      SvgPicture.asset(img_svg,width: img_size,),
      10.heightBox,
      Text(warning_txt,style: TextStyle(fontSize: text_size,fontWeight: FontWeight.w500,color: text_color),)
    ],);
  }
}
