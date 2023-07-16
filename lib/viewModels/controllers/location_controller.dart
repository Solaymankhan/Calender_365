
import 'package:calendar_365/viewModels/controllers/weather_controller.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class location_controller extends GetxController{
  RxDouble latitude=0.0.obs,longitude=0.0.obs;
  final weatherController = Get.put(weather_controller());

  @override
  void onInit() async{
    await get_location();
    await weatherController.get_weather();
    super.onInit();
  }


 Future<void> get_location() async {
    bool serviceEnabled=await Geolocator.isLocationServiceEnabled();
    if(!serviceEnabled){
      return;
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission=await Geolocator.requestPermission();
      if(permission==LocationPermission.denied)
      return;
    }
    if(permission==LocationPermission.deniedForever){
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    latitude.value = position.latitude;
    longitude.value = position.longitude;
  }
}