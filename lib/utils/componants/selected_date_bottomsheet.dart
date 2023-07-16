import 'package:calendar_365/utils/alertDialogues/addNote_alertDialogue.dart';
import 'package:calendar_365/utils/carts/home_holiday_list_cart.dart';
import 'package:calendar_365/utils/componants/add_note_button.dart';
import 'package:calendar_365/utils/componants/no_holiday.dart';
import 'package:calendar_365/utils/componants/notes_list_button.dart';
import 'package:calendar_365/utils/constants/colors.dart';
import 'package:calendar_365/utils/constants/image_paths.dart';
import 'package:calendar_365/utils/constants/strings.dart';
import 'package:calendar_365/utils/lists/bongabdo_list.dart';
import 'package:calendar_365/utils/lists/hijri_list.dart';
import 'package:calendar_365/viewModels/controllers/date_controller.dart';
import 'package:calendar_365/viewModels/controllers/holiday_controller.dart';
import 'package:calendar_365/viewModels/controllers/save_note_controller.dart';
import 'package:calendar_365/viewModels/functions/selected_day_notes.dart';
import 'package:calendar_365/views/single_note.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

RxList holiday_list = [].obs;

void show_selected_date_BottomSheet(
    BuildContext context, date, today, screenWidth, screenHeight) async {
  final date_controller dateController = Get.find();
  final holiday_controller holidayController = Get.find();
  var bongabdo_date =
      dateController.date_in_bongabdo(date.year, date.month, date.day);
  var hijri_arabic_date =
      dateController.date_in_hijri(date.year, date.month, date.day);
  holiday_list.value = await holidayController.calculate_holiday(date);
  List notes_list = await selected_day_notes(date);

  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      date.day.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 50),
                    )
                        .centered()
                        .box
                        .height(80)
                        .width(80)
                        .customRounded(BorderRadius.all(Radius.circular(100)))
                        .color(orangeSolidColor)
                        .make(),
                    Text.rich(
                      TextSpan(
                        text:
                            "${english_month_names[date.month - 1]} ${date.year}\n",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),

                        children: [
                          TextSpan(
                            text:
                                "${englishWeekDays[date.weekday]} - ${bongabdo_date.bWeekDay}\n"
                                "${bongabdo_date.bDay} ${bongabdo_date.bMonth}, ${bongabdo_date.bSeason}"
                                " ${bongabdo_date.bYear}\n"
                                "${translateNumbersToBangla((hijri_arabic_date.hDay - 1).toString())}"
                                " ${arabic_bengaliMonthNames[hijri_arabic_date.hMonth - 1]} "
                                "${translateNumbersToBangla((hijri_arabic_date.hYear).toString())}",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ).expand(),
                  ],
                ),
              ),
              Container()
                  .box
                  .width(1)
                  .height(190)
                  .margin(EdgeInsets.only(top: 10, left: 5, right: 5))
                  .color(whiteColor)
                  .make(),
              Obx(
                () => Expanded(
                    child: holiday_list.length == 0
                        ? no_holiday(
                            img_svg: light_img_svg,
                            img_size: 60.0,
                            warning_txt: no_holiday_txt,
                            text_color: whiteColor,
                            text_size: 14.0)
                        : ListView.builder(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: holiday_list.length,
                            itemBuilder: (context, index) {
                              return home_holiday_list_cart(
                                  index: index,
                                  value: holiday_list[index],
                                  textColor: whiteColor,
                                  boxColor: orangeSolidColor);
                            })),
              ),
              if (notes_list.length != 0 && screenHeight < screenWidth)
                Container()
                    .box
                    .width(1)
                    .height(190)
                    .margin(EdgeInsets.only(top: 10, left: 5, right: 5))
                    .color(whiteColor)
                    .make(),
              if (notes_list.length != 0 && screenHeight < screenWidth)
                show_notes_function(notes_list)
            ],
          ).expand(),
          if (notes_list.length != 0 && screenHeight > screenWidth)
            show_notes_function(notes_list),
          if (!today.isAfter(date))
            add_note_button(
                text: add_note_txt,
                height: 35.0,
                width: 100.0,
                onTap: () {
                  Navigator.of(context).pop();
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return add_note_alert_dialogue(
                          date: DateTime(date.year, date.month, date.day));
                    },
                  );
                })
        ],
      )
          .box
          .height(notes_list.length != 0
          && screenHeight > screenWidth ? 450 : 280)
          .margin(EdgeInsets.all(15))
          .padding(EdgeInsets.all(10))
          .width(double.infinity)
          .customRounded(BorderRadius.all(Radius.circular(10)))
          .color(orangeColor)
          .make();
    },
  );
}

Widget show_notes_function(notes_list) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      15.heightBox,
      Text(
        notes_txt,
        style: TextStyle(
            color: whiteColor, fontSize: 16, fontWeight: FontWeight.bold),
      ).box.alignBottomLeft.width(double.infinity).make(),
      10.heightBox,
      ListView.builder(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: notes_list.length,
          itemBuilder: (context, index) {
            return notes_list_button(
                text: notes_list[index].title,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => single_note(
                              title: notes_list[index].title,
                              description: notes_list[index].description)));
                });
          }).expand(),
      10.heightBox,
    ],
  ).expand();
}
