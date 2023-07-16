
import 'package:calendar_365/models/notes_model.dart';
import 'package:calendar_365/utils/componants/bottom_navbar_button.dart';
import 'package:calendar_365/utils/constants/colors.dart';
import 'package:calendar_365/utils/constants/strings.dart';
import 'package:calendar_365/viewModels/controllers/date_controller.dart';
import 'package:calendar_365/viewModels/controllers/holiday_controller.dart';
import 'package:calendar_365/viewModels/controllers/home_bottom_navigation_controller.dart';
import 'package:calendar_365/viewModels/controllers/information_controller.dart';
import 'package:calendar_365/viewModels/controllers/location_controller.dart';
import 'package:calendar_365/viewModels/controllers/save_note_controller.dart';
import 'package:calendar_365/viewModels/controllers/check_app_update_controller.dart';
import 'package:calendar_365/viewModels/controllers/set_holiday_notificatons_controller.dart';
import 'package:calendar_365/viewModels/notifications/notification_services.dart';
import 'package:calendar_365/views/holidays.dart';
import 'package:calendar_365/views/home.dart';
import 'package:calendar_365/views/notes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:upgrader/upgrader.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  /*MobileAds.instance.initialize();*/
  Hive.registerAdapter(notesmodelAdapter());
  await Hive.openBox('myBox');
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      statusBarBrightness: Brightness.light));
  await notification_service.initializeNotification();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final homeButtonNavigationController =
      Get.put(home_bottom_navigation_controller());
  /*final checkAppUpdateController =
  Get.put(check_app_update_controller());*/
  final locationController = Get.put(location_controller());
  final dateController = Get.put(date_controller());
  final holidayController = Get.put(holiday_controller());
  final saveNoteController = Get.put(save_note_controller());
  final informationController = Get.put(information_controller());
  final setHolidayNotificatonsController =
  Get.put(set_holiday_notificatons_controller());

  var nav_body = [
    holidays(),
    home(),
    notes(),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    informationController.screenWidth.value = MediaQuery.sizeOf(context).width;
    informationController.screenHeight.value =
        MediaQuery.sizeOf(context).height;
    return GetMaterialApp(
      title: 'Calendar 365',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: orangeColor),
        useMaterial3: true,
      ),
      home: UpgradeAlert(
        child: Scaffold(
          body: Column(
            children: [
              Obx(() => Expanded(
                  child: IndexedStack(
                      index:
                          homeButtonNavigationController.current_nav_indx.value,
                      children: nav_body))),
            ],
          ).marginOnly(left: 10, right: 10),
          bottomNavigationBar: Container(
            child: ClipRRect(
              child: Obx(
                () => BottomNavigationBar(
                  currentIndex:
                      homeButtonNavigationController.current_nav_indx.value,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: orangeSolidColor,
                  selectedFontSize: 13,
                  unselectedFontSize: 12,
                  unselectedLabelStyle:
                      const TextStyle(fontWeight: FontWeight.w500),
                  selectedLabelStyle:
                      const TextStyle(fontWeight: FontWeight.bold),
                  items: [
                    bottom_navbar_button(
                        CupertinoIcons.wind_snow,
                        18.0,
                        homeButtonNavigationController.current_nav_indx.value == 0
                            ? grey5Color
                            : grey6Color,
                        Holidays_txt),
                    bottom_navbar_button(
                        CupertinoIcons.square_grid_2x2,
                        18.0,
                        homeButtonNavigationController.current_nav_indx.value == 1
                            ? grey5Color
                            : grey6Color,
                        home_txt),
                    bottom_navbar_button(
                        CupertinoIcons.doc_plaintext,
                        18.0,
                        homeButtonNavigationController.current_nav_indx.value == 2
                            ? grey5Color
                            : grey6Color,
                        notes_txt),
                  ],
                  onTap: (value) {
                    homeButtonNavigationController.current_nav_indx.value = value;
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
