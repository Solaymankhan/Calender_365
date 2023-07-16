import 'package:calendar_365/utils/alertDialogues/deleteNoteAlertDialog.dart';
import 'package:calendar_365/utils/constants/colors.dart';
import 'package:calendar_365/utils/lists/hijri_list.dart';
import 'package:calendar_365/viewModels/controllers/save_note_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class home_notes_cart extends StatelessWidget {
  home_notes_cart({Key? key, required this.title, required this.description})
      : super(key: key);
  String title, description;

  @override
  Widget build(BuildContext context) {
    return SelectableText.rich(
      TextSpan(
        text: "${title}\n\n",
        style: TextStyle(
          fontSize: 16,
          color: tealColor,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: description,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ).box
        .padding(EdgeInsets.all(10))
        .margin(EdgeInsets.only(bottom: 1))
        .width(double.infinity)
        .customRounded(BorderRadius.all(Radius.circular(5)))
        .color(orangeLiteColor)
        .make();
  }
}
