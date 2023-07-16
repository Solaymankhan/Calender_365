import 'package:calendar_365/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class home_holiday_list_cart extends StatelessWidget {
  home_holiday_list_cart({Key? key,required this.index,required this.value,
    required this.textColor,required this.boxColor}) : super(key: key);
  var index,value,textColor,boxColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          (index + 1).toString(),
          style: TextStyle(
              color: orangeSolidColor,
              fontWeight: FontWeight.w500),
        )
            .box
            .roundedFull
            .padding(EdgeInsets.all(7))
            .color(grey5Color)
            .make(),
        Expanded(
          child:
          Text(value,style: TextStyle(color: textColor),)
              .box
              .padding(EdgeInsets.all(10))
              .margin(EdgeInsets.only(left: 5))
              .customRounded(BorderRadius.all(
              Radius.circular(5)))
              .color(boxColor)
              .make(),
        )
      ],
    ).marginOnly(bottom: 2);
  }
}
