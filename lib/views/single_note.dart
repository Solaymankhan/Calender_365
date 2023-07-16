import 'package:calendar_365/utils/carts/home_notes_cart.dart';
import 'package:calendar_365/utils/constants/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class single_note extends StatelessWidget {
  single_note({Key? key,required this.title,
    required this.description}) : super(key: key);
  String title, description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(CupertinoIcons.back),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(note_txt),
      ),
      body: SafeArea(
      child: home_notes_cart(title: title, description: description).marginOnly(left: 20,right: 20,bottom: 20),
    ),);
  }
}
