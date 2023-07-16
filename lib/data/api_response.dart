


import 'package:calendar_365/data/status.dart';

class api_response<T>{
  Status? status;
  T? data;
  String? message;

  api_response(this.status,this.data,this.message);


  api_response.loading():status=Status.LOADING;
  api_response.completed(this.data):status=Status.COMPLETED;
  api_response.error(this.message):status=Status.ERROR;

  @override
  String toString(){
    return "Status : $status\n Message: $message Data: $data";
  }

}