
import 'dart:convert';
import 'dart:io';

import 'package:calendar_365/data/appUrl.dart';
import 'package:calendar_365/data/network_api_service.dart';
import 'package:calendar_365/utils/alertDialogues/update_app_alertDialogue.dart';
import 'package:calendar_365/utils/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class check_app_update_controller extends GetxController{
  final _networkService=new network_api_service();
  @override
  void onInit(){
      //check_app_update();
    super.onInit();
  }

  Future<void> check_app_update() async {
    /*final newVersion = NewVersion(
      iOSId: ios_app_id,
      androidId: android_app_id,
    );
    final status = await newVersion.getVersionStatus();
    var my_map=await _networkService.getApi(check_updates_api_link);
    var data = json.decode(my_map);
    if(data["ios"]!=app_version)
      update_app_alertDialogue();*/
  }
}