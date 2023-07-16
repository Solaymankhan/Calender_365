import 'package:calendar_365/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class add_note_button extends StatelessWidget {
  add_note_button({Key? key,required this.text,required this.height,required this.width,required this.onTap})
      : super(key: key);
  final Function()? onTap;
  var height,width,text;
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20.0),
      color: orangeSolidColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(20.0),
        onTap: this.onTap,
        child: Text(
          text,
          style: TextStyle(
              color: whiteColor, fontWeight: FontWeight.bold, fontSize: 12),
        )
            .centered()
            .box
            .height(height)
            .width(width)
            .border(width: 1, color: whiteColor)
            .customRounded(BorderRadius.all(Radius.circular(20)))
            .make(),
      ),
    );
  }
}
