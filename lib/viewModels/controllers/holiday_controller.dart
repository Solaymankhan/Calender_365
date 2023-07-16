
import 'package:calendar_365/utils/lists/holidays_list.dart';
import 'package:calendar_365/viewModels/controllers/date_controller.dart';
import 'package:get/get.dart';

class holiday_controller extends GetxController{
  final date_controller dateController = Get.find();
  calculate_holiday(_focusedDay)async{
    List holiday_list=[];
    if(holidays_english_list.containsKey("${_focusedDay.day}-${_focusedDay.month}")){
      holiday_list.add(holidays_english_list["${_focusedDay.day}-${_focusedDay.month}"]);
    }
    if(buddha_purnima_shuva_janmastomi_bijay_dashami_list
        .containsKey("${_focusedDay.day}-${_focusedDay.month}-${_focusedDay.year}")){
      holiday_list.add(buddha_purnima_shuva_janmastomi_bijay_dashami_list
      ["${_focusedDay.day}-${_focusedDay.month}-${_focusedDay.year}"]);
    }
    var bongabdo_date = await dateController.date_in_bongabdo(_focusedDay.year,_focusedDay.month,_focusedDay.day);
    if(holidays_bengali_list.containsKey("${bongabdo_date.bDay}-${bongabdo_date.bMonth}")){
      holiday_list.add(holidays_bengali_list["${bongabdo_date.bDay}-${bongabdo_date.bMonth}"]);
    }
    var hijri_arabic_date = await dateController.date_in_hijri(_focusedDay.year,_focusedDay.month,_focusedDay.day-1);
    if(holidays_arabic_list.containsKey("${hijri_arabic_date.hDay}-${hijri_arabic_date.hMonth}")){
      holiday_list.add(holidays_arabic_list["${hijri_arabic_date.hDay}-${hijri_arabic_date.hMonth}"]);
    }


    return holiday_list;
  }




}