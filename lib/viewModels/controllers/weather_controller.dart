

import 'package:calendar_365/data/appUrl.dart';
import 'package:calendar_365/data/network_api_service.dart';
import 'package:calendar_365/models/wether_model.dart';
import 'package:get/get.dart';

class weather_controller extends GetxController{
  final _networkService=new network_api_service();
  WetherModel? data;
  RxString place_name=''.obs,tempurature=''.obs,weather_condition=''.obs,
           clouds=''.obs,humidity=''.obs,wind_speed=''.obs;

  Future<void> get_weather() async {
    var value_id_json=await _networkService.getApi(link);
    data=wetherModelFromJson((value_id_json).toString());
    place_name.value=data!.name.toString();
    tempurature.value=data!.main!.temp.toString();
    weather_condition.value=data!.weather![0].main.toString();
    clouds.value=data!.clouds!.all.toString();
    humidity.value=data!.main!.humidity.toString();
    wind_speed.value=data!.wind!.speed.toString();
  }
}