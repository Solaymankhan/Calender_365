import 'package:calendar_365/utils/alertDialogues/deleteNoteAlertDialog.dart';
import 'package:calendar_365/utils/constants/colors.dart';
import 'package:calendar_365/utils/lists/hijri_list.dart';
import 'package:calendar_365/viewModels/controllers/save_note_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class notes_cart extends StatelessWidget {
  notes_cart(
      {Key? key,
      required this.date,
      required this.title,
      required this.description,
      required this.notification_id,
      required this.index})
      : super(key: key);
  final save_note_controller saveNoteController = Get.find();
  int index,notification_id;
  DateTime date;
  String title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectableText(
              title,
              style: TextStyle(
                fontSize: 16,
                color: tealColor,
                fontWeight: FontWeight.bold,
              ),
            ).expand(),
            Material(
              borderRadius: BorderRadius.circular(50),
              color: orangeLiteColor,
              child: InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () {
                  showDeleteNoteAlertDialog(context, index,notification_id);
                },
                child: Icon(
                  CupertinoIcons.clear,
                  size: 20,
                )
                    .centered()
                    .box
                    .height(30)
                    .width(30)
                    .customRounded(BorderRadius.all(Radius.circular(50)))
                    .make(),
              ),
            ),
          ],
        ),
        SelectableText(
          description,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    )
        .box
        .padding(EdgeInsets.all(10))
        .margin(EdgeInsets.only(bottom: 3))
        .width(double.infinity)
        .customRounded(BorderRadius.all(Radius.circular(5)))
        .color(orangeLiteColor)
        .make();
  }
}
