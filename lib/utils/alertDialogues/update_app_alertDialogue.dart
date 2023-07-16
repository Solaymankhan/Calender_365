import 'package:calendar_365/utils/constants/colors.dart';
import 'package:calendar_365/utils/constants/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


update_app_alertDialogue() {
  Get.defaultDialog(
    backgroundColor: orangeColor,
    radius: 10,
    title: update_avlbl_txt,
    titleStyle: TextStyle(fontWeight: FontWeight.bold, color: whiteColor),
    barrierDismissible: false,
    content: Text(
      update_description_txt,
      style: TextStyle(color: whiteColor, fontWeight: FontWeight.w500),
    ),
    confirm: ElevatedButton(
      onPressed: () {
        Get.back();
      },
      child: Text(update_now_txt),
    ),
  );
}
