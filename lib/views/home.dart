import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:calendar_365/utils/alertDialogues/cancelAppAlertDialog.dart';
import 'package:calendar_365/utils/alertDialogues/update_app_alertDialogue.dart';
import 'package:calendar_365/utils/carts/bangla_arabic_date_column.dart';
import 'package:calendar_365/utils/carts/bangla_arabic_date_row.dart';
import 'package:calendar_365/utils/carts/home_holiday_list_cart.dart';
import 'package:calendar_365/utils/carts/home_notes_cart.dart';
import 'package:calendar_365/utils/carts/small_banner_add_cart.dart';
import 'package:calendar_365/viewModels/adds/home_page_adds.dart';
import 'package:calendar_365/viewModels/notifications/holiday_notes_notification.dart';
import 'package:calendar_365/viewModels/notifications/notification_services.dart';
import 'package:calendar_365/utils/componants/no_holiday.dart';
import 'package:calendar_365/utils/componants/selected_date_bottomsheet.dart';
import 'package:calendar_365/utils/componants/text_shape.dart';
import 'package:calendar_365/utils/componants/weather_icon_text.dart';
import 'package:calendar_365/utils/constants/colors.dart';
import 'package:calendar_365/utils/constants/image_paths.dart';
import 'package:calendar_365/utils/constants/strings.dart';
import 'package:calendar_365/utils/constants/values.dart';
import 'package:calendar_365/utils/lists/bongabdo_list.dart';
import 'package:calendar_365/utils/lists/hijri_list.dart';
import 'package:calendar_365/viewModels/controllers/date_controller.dart';
import 'package:calendar_365/viewModels/controllers/holiday_controller.dart';
import 'package:calendar_365/viewModels/controllers/home_bottom_navigation_controller.dart';
import 'package:calendar_365/viewModels/controllers/information_controller.dart';
import 'package:calendar_365/viewModels/controllers/save_note_controller.dart';
import 'package:calendar_365/viewModels/controllers/weather_controller.dart';
import 'package:calendar_365/viewModels/functions/clock.dart';
import 'package:calendar_365/viewModels/functions/is_holiday.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:calendar_365/viewModels/helpers/adUnit_platform_helper.dart';

const int maxFailedLoadAttempts = 3;
class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
 /* final homeAdController = Get.put(home_page_adds());*/
  final home_bottom_navigation_controller bottomNavigationController =
      Get.find();
  final holiday_controller holidayController = Get.find();
  final date_controller dateController = Get.find();
  final weather_controller weatherController = Get.find();
  final information_controller informationController = Get.find();
  final save_note_controller saveNoteController = Get.find();

  DateTime _focusedDay = DateTime.now();
  var bongabdo_date, hijri_arabic_date;
  RxList holiday_list = [].obs;
  bool is_hlydy = false;
  /*
  InterstitialAd? _interstitialAd;
  int _interstitialLoadAttempts = 0;

 void _createInterstitialAd() {
    InterstitialAd.load(
      adUnitId: adUnit_platform_helper.interstitialAdUnitId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          _interstitialAd = ad;
          _interstitialLoadAttempts = 0;
        },
        onAdFailedToLoad: (LoadAdError error) {
          _interstitialLoadAttempts += 1;
          _interstitialAd = null;
          if (_interstitialLoadAttempts <= maxFailedLoadAttempts) {
            _createInterstitialAd();
          }
        },
      ),
    );
  }
  void _showInterstitialAd() {
    if (_interstitialAd != null) {
      _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (InterstitialAd ad) {
          ad.dispose();
          _createInterstitialAd();
        },
        onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
          ad.dispose();
          _createInterstitialAd();
        },
      );
      _interstitialAd!.show();
    }
  }*/
  @override
  void initState() {
    initialise_date();
  /*  _createInterstitialAd();*/
    super.initState();
  }
  @override
  void dispose() {
    /*homeAdController.bottomBannerAd.dispose();
    _interstitialAd?.dispose();*/
    super.dispose();
  }

  initialise_date() async {
    holiday_list.value = await holidayController.calculate_holiday(_focusedDay);
  }


  @override
  Widget build(BuildContext context) {
    bongabdo_date = dateController.date_in_bongabdo(
        _focusedDay.year, _focusedDay.month, _focusedDay.day);
    hijri_arabic_date = dateController.date_in_hijri(
        _focusedDay.year, _focusedDay.month, _focusedDay.day);
    return WillPopScope(
      onWillPop: () async {
        if (bottomNavigationController.current_nav_indx.value != 1) {
          bottomNavigationController.current_nav_indx.value = 1;
          return false;
        }
        return await showCancelAppAlertDialog(context) ?? false;
      },
      child: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      text_shape(
                              text: _focusedDay.day.toString(),
                              txt_color: Colors.white,
                              txt_weight: FontWeight.bold,
                              txt_size: 50.0)
                          .centered()
                          .box
                          .height(80)
                          .width(80)
                          .customRounded(BorderRadius.all(Radius.circular(100)))
                          .color(orangeSolidColor)
                          .make(),
                      text_shape(
                          text:
                              "${english_month_names[_focusedDay.month - 1]} ${_focusedDay.year}",
                          txt_color: Colors.white,
                          txt_weight: FontWeight.bold,
                          txt_size: 25.0),
                      text_shape(
                          text:
                              "${englishWeekDays[_focusedDay.weekday]} - ${bongabdo_date.bWeekDay}",
                          txt_color: Colors.white,
                          txt_weight: FontWeight.bold,
                          txt_size: 14.0),
                      text_shape(
                              text:
                                  "${bongabdo_date.bDay} ${bongabdo_date.bMonth}, ${bongabdo_date.bSeason}"
                                  " ${bongabdo_date.bYear}\n"
                                  "${translateNumbersToBangla((hijri_arabic_date.hDay - 1).toString())}"
                                  " ${arabic_bengaliMonthNames[hijri_arabic_date.hMonth - 1]} "
                                  "${translateNumbersToBangla((hijri_arabic_date.hYear).toString())}",
                              txt_color: Colors.white,
                              txt_weight: FontWeight.bold,
                              txt_size: 14.0)
                          .expand(),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Obx(
                      () => Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          weatherController.clouds.value == ''
                              ? Container()
                              : Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        text_shape(
                                            text: weatherController
                                                .tempurature.value,
                                            txt_color: Colors.white,
                                            txt_weight: FontWeight.bold,
                                            txt_size: 50.0),
                                        text_shape(
                                            text: "o",
                                            txt_color: Colors.white,
                                            txt_weight: FontWeight.bold,
                                            txt_size: 20.0),
                                        text_shape(
                                            text: "C",
                                            txt_color: Colors.white,
                                            txt_weight: FontWeight.bold,
                                            txt_size: 25.0)
                                      ],
                                    ),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          SvgPicture.asset(
                                            weather_img_svg,
                                            width: 20,
                                            height: 20,
                                          ).marginOnly(right: 10),
                                          text_shape(
                                              text: weatherController
                                                  .weather_condition.value,
                                              txt_color: Colors.white,
                                              txt_weight: FontWeight.bold,
                                              txt_size: 18.0)
                                        ]),
                                    10.heightBox,
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          weather_icon_txt(
                                              icon: cloud_img_svg,
                                              text: weatherController
                                                  .clouds.value),
                                          weather_icon_txt(
                                              icon: humidity_img_svg,
                                              text: weatherController
                                                  .humidity.value),
                                          weather_icon_txt(
                                              icon: wind_speed_img_svg,
                                              text:
                                                  "${weatherController.wind_speed.value} km/h"),
                                        ]),
                                    15.heightBox,
                                  ],
                                ),
                          clock(
                              size: 14.0,
                              color: Colors.white,
                              weight: FontWeight.bold)
                        ],
                      ),
                    ),
                  )
                ],
              )
                  .box
                  .height(200)
                  .margin(EdgeInsets.only(top: 10))
                  .padding(EdgeInsets.all(10))
                  .width(double.infinity)
                  .customRounded(BorderRadius.all(Radius.circular(10)))
                  .color(orangeColor)
                  .make()
                  .onTap(() {
                setState(() {
                });
              }),
              /*Obx(()=>small_banner_add_cart(
                        ad: homeAdController.topBannerAd,
                        isBannerAdLoaded: homeAdController.isTopBannerAdLoaded.value,
                        isAdClicked: homeAdController.isTopAdClicked.value,
                        bannerHeight: homeAdController.topBannerAd.size.height.toDouble(),
                        bannerWidth: homeAdController.topBannerAd.size.width.toDouble())
              ),*/
              TableCalendar(
                focusedDay: _focusedDay,
                firstDay: DateTime(starting_year),
                lastDay: DateTime(ending_year),
                daysOfWeekHeight: 40,
                rowHeight: informationController.screenWidth.value < less_width
                    ? 70
                    : 60,
                calendarBuilders: CalendarBuilders(
                  headerTitleBuilder: (context, day) {
                    var date_in_bengali1 =
                        dateController.date_in_bongabdo(day.year, day.month, 1);
                    var date_in_bengali2 = dateController.date_in_bongabdo(
                        day.year, day.month, 28);
                    var date_in_arabic1 =
                        dateController.date_in_hijri(day.year, day.month, 1);
                    var date_in_arabic2 =
                        dateController.date_in_hijri(day.year, day.month, 28);
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '${english_month_names[day.month - 1]} ${day.year}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${date_in_bengali1.bMonth} - ${date_in_bengali2.bMonth} ${date_in_bengali2.bYear}',
                          style: TextStyle(
                            fontSize: 12,
                            color: tealColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${arabic_bengaliMonthNames[date_in_arabic1.hMonth - 1]} - '
                          '${arabic_bengaliMonthNames[date_in_arabic2.hMonth - 1]} '
                          '${translateNumbersToBangla(date_in_arabic2.hYear.toString())}',
                          style: TextStyle(
                            fontSize: 12,
                            color: purpleColor,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    );
                  },
                  dowBuilder: (context, day) {
                    if (day.weekday == DateTime.friday ||
                        day.weekday == DateTime.saturday) {
                      final text = DateFormat.E().format(day);
                      return Text(
                        short_brangla_week_name[text]!,
                        style: TextStyle(
                            color: orangeSolidColor,
                            fontWeight: FontWeight.bold),
                      ).centered();
                    } else {
                      final text = DateFormat.E().format(day);
                      return Text(
                        short_brangla_week_name[text]!,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ).centered();
                    }
                  },
                  defaultBuilder: (context, day, _) {
                    var date_in_bengali = dateController.date_in_bongabdo(
                        day.year, day.month, day.day);
                    var date_in_arabic = dateController.date_in_hijri(
                        day.year, day.month, day.day - 1);
                    is_hlydy = is_holiday(day, date_in_bengali, date_in_arabic);

                    return Column(
                      children: [
                        Text(
                          day.day.toString(),
                          style: TextStyle(
                            fontSize: 20,
                            color: (is_hlydy) ? orangeSolidColor : blackColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ).expand(),
                        informationController.screenWidth.value < less_width
                            ? bangla_arabic_date_column(
                                bangla_day: date_in_bengali.bDay,
                                arabic_day: date_in_arabic.hDay.toString(),
                                bangla_day_color: tealColor,
                                arabic_day_color: purpleColor)
                            : bangla_arabic_date_row(
                                bangla_day: date_in_bengali.bDay,
                                arabic_day: date_in_arabic.hDay.toString(),
                                bangla_day_color: tealColor,
                                arabic_day_color: purpleColor)
                      ],
                    )
                        .box
                        .width(double.infinity)
                        .padding(EdgeInsets.only(left: 7, right: 7, top: 5))
                        .border(color: orangeColor, width: 0.05)
                        .color(is_hlydy ? orangeLiteColor : Colors.transparent)
                        .customRounded(BorderRadius.all(Radius.circular(5)))
                        .make();
                  },
                  todayBuilder: (context, day, _) {
                    var date_in_bengali = dateController.date_in_bongabdo(
                        day.year, day.month, day.day);
                    var date_in_arabic = dateController.date_in_hijri(
                        day.year, day.month, day.day - 1);
                    return Column(
                      children: [
                        Text(
                          day.day.toString(),
                          style: TextStyle(
                            fontSize: 26,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ).expand(),
                        informationController.screenWidth.value < less_width
                            ? bangla_arabic_date_column(
                                bangla_day: date_in_bengali.bDay,
                                arabic_day: date_in_arabic.hDay.toString(),
                                bangla_day_color: whiteColor,
                                arabic_day_color: whiteColor)
                            : bangla_arabic_date_row(
                                bangla_day: date_in_bengali.bDay,
                                arabic_day: date_in_arabic.hDay.toString(),
                                bangla_day_color: whiteColor,
                                arabic_day_color: whiteColor)
                      ],
                    )
                        .box
                        .padding(EdgeInsets.only(left: 7, right: 7, top: 5))
                        .width(double.infinity)
                        .color(orangeColor)
                        .customRounded(BorderRadius.all(Radius.circular(5)))
                        .make();
                  },
                ),
                calendarStyle: CalendarStyle(
                  isTodayHighlighted: true,
                  selectedDecoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  selectedTextStyle: TextStyle(color: Colors.white),
                  todayDecoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  defaultDecoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  weekendDecoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleTextStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                onDaySelected: (date, event) {
                  show_selected_date_BottomSheet(
                      context,
                      date,
                      _focusedDay,
                      informationController.screenWidth.value,
                      informationController.screenHeight.value);
                },
              ),
              Obx(() => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      holiday_list.length == 0 ? 40.heightBox : 20.heightBox,
                      if (holiday_list.length != 0)
                        Text(
                          today_holiday_bangla_txt,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ).marginOnly(bottom: 10),
                      holiday_list.length == 0
                          ? no_holiday(
                                  img_svg: light_img_svg,
                                  img_size: 60.0,
                                  warning_txt: no_holiday_txt,
                                  text_color: blackColor,
                                  text_size: 14.0)
                              .centered()
                          : ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: holiday_list.length,
                              itemBuilder: (context, index) {
                                return home_holiday_list_cart(
                                    index: index,
                                    value: holiday_list[index],
                                    textColor: blackColor,
                                    boxColor: orangeLiteColor);
                              }),
                      if (saveNoteController.today_notes_list.length != 0)
                        Text(
                          notes_txt,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ).marginOnly(top: 10, bottom: 10),
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: saveNoteController.today_notes_list.length,
                          itemBuilder: (context, index) {
                            return home_notes_cart(
                                    title: saveNoteController
                                        .today_notes_list[index].title,
                                    description: saveNoteController
                                        .today_notes_list[index].description)
                                .marginOnly(bottom: 2);
                          })
                    ],
                  )),
              30.heightBox,
             /* Obx(()=>small_banner_add_cart(
                            ad: homeAdController.bottomBannerAd,
                            isBannerAdLoaded: homeAdController.isBottomBannerAdLoaded.value,
                            isAdClicked: homeAdController.isBottomAdClicked.value,
                            bannerHeight: homeAdController.bottomBannerAd.size.height.toDouble(),
                            bannerWidth: homeAdController.bottomBannerAd.size.width.toDouble())
              )*/
            ],
          ),
        ),
      ),
    );
  }
}

