import 'package:calendar_365/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class notes_list_button extends StatelessWidget {
  notes_list_button({Key? key,required this.text,required this.onTap}) : super(key: key);

  final Function() onTap;
  var text;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(5),
      color: orangeSolidColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap:onTap,
        child: Text(
          text,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(
              color: whiteColor,
              fontWeight: FontWeight.w500),
        ).box.padding(EdgeInsets.all(10)).make(),
      ),
    ).marginOnly(bottom: 2);
  }
}
