

import 'package:calendar_365/viewModels/controllers/location_controller.dart';
import 'package:get/get.dart';

final location_controller locationController = Get.find();

final api_key="0f65bf709d9eddc15b3c03ae732e4940";
var link="https://api.openweathermap.org/data/2.5/weather?"
    "lat=${locationController.latitude.value}&lon=${locationController.longitude.value}"
    "&appid=${api_key}&units=metric";

var check_updates_api_link="https://good-pink-moose-tux.cyclic.app/check_update";