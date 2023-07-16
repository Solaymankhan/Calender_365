import 'package:calendar_365/utils/carts/notes_cart.dart';
import 'package:calendar_365/utils/componants/no_holiday.dart';
import 'package:calendar_365/utils/constants/colors.dart';
import 'package:calendar_365/utils/constants/image_paths.dart';
import 'package:calendar_365/utils/constants/strings.dart';
import 'package:calendar_365/utils/lists/bongabdo_list.dart';
import 'package:calendar_365/utils/lists/hijri_list.dart';
import 'package:calendar_365/viewModels/controllers/save_note_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';


class notes extends StatelessWidget {
  notes({Key? key}) : super(key: key);
  final save_note_controller saveNoteController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => notesWidget(),
      ),
    );
  }

  Widget notesWidget() {
    switch (saveNoteController.notes_list.length) {
      case > 0:
        return notesList();
      default:
        return no_holiday(
                img_svg: note_img_svg,
                img_size: 60.0,
                warning_txt: empty_note_txt,
                text_color: blackColor,
                text_size: 14.0)
            .centered();
    }
  }

  Widget notesList() {
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: saveNoteController.notes_list.length,
        itemBuilder: (context, index) {
          bool is_show_date = index == 0
              ? true
              : saveNoteController.notes_list[index].date !=
                  saveNoteController.notes_list[index - 1].date;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (is_show_date)
                Text(
                  "${saveNoteController.notes_list[index].date.day} "
                  "${english_month_names[saveNoteController.notes_list[index].date.month - 1]} "
                  "${saveNoteController.notes_list[index].date.year}",
                  style: TextStyle(
                    fontSize: 20,
                    color: orangeSolidColor,
                    fontWeight: FontWeight.bold,
                  ),
                ).marginOnly(top: 10),
              notes_cart(date: saveNoteController.notes_list[index].date,
                  title: saveNoteController.notes_list[index].title,
                  description: saveNoteController.notes_list[index].description,
                  notification_id: saveNoteController.notes_list[index].id,
                  index: index)
              ,
            ],
          );
        });
  }
}
