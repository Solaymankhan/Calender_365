import 'package:calendar_365/utils/componants/add_note_button.dart';
import 'package:calendar_365/utils/constants/colors.dart';
import 'package:calendar_365/utils/constants/strings.dart';
import 'package:calendar_365/viewModels/controllers/save_note_controller.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class add_note_alert_dialogue extends StatelessWidget {
  add_note_alert_dialogue({Key? key,required this.date}) : super(key: key);
  final DateTime date;
  DateTime now = DateTime.now();
  final GlobalKey<FormState> note_form_key=GlobalKey<FormState>();
  final save_note_controller saveNoteController = Get.find();
  TextEditingController _titleTextController = TextEditingController();
  TextEditingController _descriptionTextController = TextEditingController();
  FocusNode _title_focusNode = FocusNode();
  FocusNode _description_focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: note_form_key,
      child: AlertDialog(
        backgroundColor: orangeColor,
        title: Text('Add Note',style: TextStyle(fontWeight: FontWeight.bold,color: whiteColor),),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _titleTextController,
              maxLength: 50,
              style: TextStyle(color: whiteColor,fontWeight: FontWeight.bold),
              focusNode: _title_focusNode, //
              cursorColor: whiteColor,// Add this line
              decoration: InputDecoration(
                labelText: 'Title',
                contentPadding: EdgeInsets.all(8),
                counterStyle: TextStyle(color: whiteColor),
                labelStyle: TextStyle(color: whiteColor),
                errorStyle: TextStyle(color: whiteColor),
                focusedBorder: OutlineInputBorder( // Add this block
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: whiteColor, // Set focused border color
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: CupertinoColors.systemGrey4, // Set unfocused border color
                  ),
                ),
                border: OutlineInputBorder( // Add this block
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    width: 1,
                    color: CupertinoColors.systemGrey4, // Set unfocused border color
                  ),
                ),
              ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return title_required_txt;
                  }
                  return null;
                }
            ),
            15.heightBox,
            SizedBox(
              child: TextFormField(
                controller: _descriptionTextController,
                style: TextStyle(color: whiteColor),
                maxLines: 4,
                minLines: 1,
                maxLength: 500,
                  cursorColor: whiteColor,
                focusNode: _description_focusNode, // Add this line
                decoration: InputDecoration(
                  labelText: 'Description',
                  contentPadding: EdgeInsets.all(8),
                  errorStyle: TextStyle(color: whiteColor),
                  counterStyle: TextStyle(color: whiteColor),
                  labelStyle: TextStyle(color: whiteColor),
                  focusedBorder: OutlineInputBorder( // Add this block
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: whiteColor, // Set focused border color
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: CupertinoColors.systemGrey4, // Set unfocused border color
                    ),
                  ),
                  border: OutlineInputBorder( // Add this block
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      width: 1,
                      color: CupertinoColors.systemGrey4, // Set unfocused border color
                    ),
                  ),
                ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return description_required_txt;
                    }
                    return null;
                  }
              ),
            ),
          ],
        ),
        actions: [
          add_note_button(text: cancel_txt,height: 35.0, width: 70.0, onTap: () {
            Navigator.of(context).pop();
          }),
          add_note_button(text: add_txt, height: 35.0, width: 70.0,
              onTap: () {
            if(check_note_valid()){
              Navigator.of(context).pop();
              saveNoteController.save_note(
                  date,
                  _titleTextController.text,
                  _descriptionTextController.text,
                  now.millisecondsSinceEpoch & 0xFFFFFFFF);
            }
          }),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }


  bool check_note_valid(){
    final isValid=note_form_key.currentState!.validate();
    if(!isValid) {
      return false;
    }
    else{
      note_form_key.currentState!.save();
      return true;
    }
  }
}
