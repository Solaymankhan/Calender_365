import 'dart:io';

import 'package:calendar_365/data/app_exeptions.dart';
import 'package:calendar_365/models/wether_model.dart';
import 'package:http/http.dart' as http;
import 'package:calendar_365/data/base_api_service.dart';

class network_api_service extends base_api_service{
  
  @override
  Future getApi(String url) async{
    var responseJson;
    try{
      final response=await http.get(Uri.parse(url));
      responseJson=returnResponse(response);
      return responseJson;
    }on SocketException{
      throw InternetExeption;
    }on RequestTimeout{
      throw RequestTimeout;
    }
  }

  dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        //var responseJson=wetherModelFromJson(response.body.toString());
        return response.body;
      case 400:
        throw InvalidUrl;
      default:
        throw FetchDataExeption;
    }
  }
}