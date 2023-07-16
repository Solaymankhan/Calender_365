import 'dart:io';
import 'package:calendar_365/viewModels/notifications/notification_services.dart';
import 'package:calendar_365/utils/constants/colors.dart';
import 'package:calendar_365/utils/constants/strings.dart';
import 'package:calendar_365/viewModels/controllers/save_note_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

final save_note_controller saveNoteController = Get.find();

showDeleteNoteAlertDialog(BuildContext context, int index,int notification_id) async => showCupertinoModalPopup(
  context: context,
  builder: (context) => CupertinoAlertDialog(
    title: new Text(
      sure_txt,
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 20, color: orangeColor),
    ),
    content: new Text(
      delete_note_alert_txt,
      style: TextStyle(fontSize: 14, color: blackColor),
    ),
    actions: <CupertinoDialogAction>[
      CupertinoDialogAction(
        isDefaultAction: true,
        onPressed: () => Navigator.of(context).pop(),
        child: new Text('No',style: TextStyle(color: tealColor),),
      ),
      CupertinoDialogAction(
        isDestructiveAction: true,
        onPressed: () => {
          Navigator.of(context).pop(),
          saveNoteController.notes_list.removeAt(index),
          saveNoteController.save_only_note_list(),
          notification_service.cancelNotificationMethod(notification_id)
        },
        child: new Text('Yes',style: TextStyle(color: orangeColor,fontWeight: FontWeight.bold),),
      ),
    ],
  ),
);