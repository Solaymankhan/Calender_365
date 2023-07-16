import 'package:calendar_365/utils/constants/colors.dart';
import 'package:calendar_365/utils/lists/bongabdo_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class bangla_arabic_date_column extends StatelessWidget {
  bangla_arabic_date_column(
      {Key? key, required this.bangla_day, required this.arabic_day,
        required this.bangla_day_color, required this.arabic_day_color})
      : super(key: key);
  var bangla_day, arabic_day,bangla_day_color, arabic_day_color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          bangla_day,
          style: TextStyle(
            fontSize: 12,
            color: bangla_day_color,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          translateNumbersToBangla(arabic_day),
          style: TextStyle(
            fontSize: 12,
            color: arabic_day_color,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
