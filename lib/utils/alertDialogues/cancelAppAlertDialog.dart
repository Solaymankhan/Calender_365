import 'dart:io';

import 'package:calendar_365/utils/constants/colors.dart';
import 'package:calendar_365/utils/constants/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



showCancelAppAlertDialog(BuildContext context) async => showCupertinoModalPopup(
  context: context,
  builder: (context) => CupertinoAlertDialog(
    title: new Text(
      sure_txt,
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 20, color: orangeColor),
    ),
    content: new Text(
      close_app_txt,
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
        SystemNavigator.pop()
        },
        child: new Text('Yes',style: TextStyle(color: orangeColor,fontWeight: FontWeight.bold),),
      ),
    ],
  ),
);