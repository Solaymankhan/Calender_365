

class app_exeptions implements Exception{

  final _message;
  final _prefix;
  app_exeptions([this._message,this._prefix]);

  String toString(){
    return "$_prefix$_message";
  }
}

class InternetExeption extends app_exeptions{
  InternetExeption([String? message]):
      super(message,"No internet");
}


class RequestTimeout extends app_exeptions{
  RequestTimeout([String? message]):
        super(message,"Request Timeout");
}

class InvalidUrl extends app_exeptions{
  InvalidUrl([String? message]):
        super(message,"Invalid URL");
}

class FetchDataExeption extends app_exeptions{
  FetchDataExeption([String? message]):
        super(message,"Fetch Data Exeption");
}