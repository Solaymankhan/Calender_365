
import 'package:calendar_365/viewModels/notifications/holiday_notes_notification.dart';
import 'package:calendar_365/utils/lists/hijri_list.dart';
import 'package:calendar_365/utils/lists/holidays_year_wise_list.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class set_holiday_notificatons_controller extends GetxController{
  DateTime now = DateTime.now();
  var box = Hive.box('myBox');
  List notification_year=[];
  @override
  void onInit()async{
    await notification_seted();
    if(!notification_year.contains(now.year))
    await holiday_notifications();
    super.onInit();
  }
  holiday_notifications(){
    List years_list=[];
    for(int i=0;i<2;i++){
      years_list.add(now.year+i);
      for(var list_value in holiday_year_wise_list[(now.year+i).toString()]!){
        List day_list=list_value["date"].split(" ");
        int year=now.year+i;
        int month=english_month_names.indexOf(day_list[1])+1;
        int day=int.parse(day_list[0]);
        save_holiday_notification_calendar(
            now.millisecondsSinceEpoch & 0xFFFFFFFF,
            list_value['holiday_for'],
            "asset://${list_value['holiday_for']}",
            year,
            month,
            day);
      }
    }
    box.put("year_key",years_list);
  }

  Future<void> notification_seted()async{
    notification_year=box.get("year_key")==null?[]:box.get("year_key");
  }

}