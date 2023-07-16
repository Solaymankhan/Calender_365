import 'package:calendar_365/viewModels/functions/bongabdo_calculation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hijri/hijri_calendar.dart';

class date_controller extends GetxController{

  date_in_bongabdo(yr,mnt,dy){
    var bongabdo_date =Bongabdo.fromDate(
        new DateTime(yr, mnt,dy),"new");
    return bongabdo_date;
  }

  date_in_hijri(yr, mnt,dy){
    var hijri_date =HijriCalendar.fromDate(
        DateTime(yr, mnt,dy));
    return hijri_date;
  }

}
