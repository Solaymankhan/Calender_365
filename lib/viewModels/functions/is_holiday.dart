

import 'package:calendar_365/utils/lists/holidays_list.dart';

is_holiday(day,date_in_bengali,date_in_arabic){
  if(day.weekday == DateTime.friday ||day.weekday == DateTime.saturday)
    return true;
  if(holidays_english_list.containsKey("${day.day}-${day.month}"))
    return true;
  if(buddha_purnima_shuva_janmastomi_bijay_dashami_list
      .containsKey("${day.day}-${day.month}-${day.year}"))
    return true;
  if(holidays_bengali_list.containsKey("${date_in_bengali.bDay}-${date_in_bengali.bMonth}"))
    return true;
  if(holidays_arabic_list.containsKey("${date_in_arabic.hDay}-${date_in_arabic.hMonth}"))
    return true;

  return false;
}