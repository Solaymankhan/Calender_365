import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';


class weather_icon_txt extends StatelessWidget {
  weather_icon_txt({Key? key,required this.icon,required this.text}) : super(key: key);
  var icon,text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          icon,
          width: 20,
          height: 15,
        ).marginOnly(right: 10).marginOnly(left: 10),
        Text(
          text,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14),
        )
      ],).marginOnly(left: 5);
  }
}
