

import 'package:calendar_365/viewModels/controllers/save_note_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

final save_note_controller saveNoteController = Get.find();
List selected_day_notes(today){
  List today_notes_list=[];
  for(var val in saveNoteController.notes_list){
    if(val.date.day==today.day && val.date.month==today.month && val.date.year==today.year) {
      today_notes_list.add(val);
    }
  }
  return today_notes_list;
}
