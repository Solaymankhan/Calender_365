import 'package:calendar_365/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';


class holiday_cart extends StatelessWidget {
  holiday_cart({Key? key,required this.index,required this.image,
    required this.date,required this.holiday_for}) : super(key: key);

  var index,image,date,holiday_for;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.only(bottom: 2,top: index==0?10:0),
      decoration: BoxDecoration(
          image:DecorationImage(image: AssetImage(image),fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(date,
            style: TextStyle(
              fontSize: 20,
              color: whiteColor,
              fontWeight: FontWeight.bold,
            ),),
          Text(
            holiday_for,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 16,
              color: whiteColor,
              fontWeight: FontWeight.bold,
            ),
          )
        ],).box.color(blackColor.withOpacity(0.6))
          .customRounded(BorderRadius.all(Radius.circular(10)))
          .padding(EdgeInsets.all(10))
          .make(),
    );
  }
}
