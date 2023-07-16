import 'dart:convert';

import 'package:calendar_365/models/notes_model.dart';
import 'package:calendar_365/viewModels/functions/selected_day_notes.dart';
import 'package:calendar_365/viewModels/notifications/holiday_notes_notification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class save_note_controller extends GetxController{
  DateTime _today = DateTime.now();
  var box = Hive.box('myBox');
  RxList notes_list=[].obs,today_notes_list = [].obs;
  @override
  void onInit(){
    get_note();
    today_notes();
    super.onInit();
  }

  void save_note(DateTime date,String title,String description,int id){
    notes_list.add(notes_model(date: date, title: title, description: description,id: id));
    notes_list.sort((a, b) => a.date.compareTo(b.date));
    box.put("NotesKey",notes_list);
    save_note_notification_calendar(date,title,description,id);
  }
  void save_only_note_list(){
    box.put("NotesKey",notes_list);
    today_notes();
  }

  get_note(){
    var v=box.get("NotesKey")==null?[]:box.get("NotesKey");
    for (var val in v){
      bool is_same_day=(_today.day==val.date.day &&
          _today.month==val.date.month &&_today.year==val.date.year)?true:false;
      if(_today.isBefore(val.date) || is_same_day)
        notes_list.add(notes_model(
            date: val.date, title: val.title, description: val.description,id: val.id));
    }
  }

  today_notes() async {
    today_notes_list.clear();
    for(var val in notes_list){
      if(val.date.day==_today.day && val.date.month==_today.month && val.date.year==_today.year)
        today_notes_list.add(val);

    }
  }

}