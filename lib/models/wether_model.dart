import 'dart:convert';

WetherModel wetherModelFromJson(String str) => WetherModel.fromJson(json.decode(str));


class WetherModel {
  List<Weather>? weather;
  Main? main;
  Wind? wind;
  Clouds? clouds;
  String? name;

  WetherModel({
    required this.weather,
    required this.main,
    required this.wind,
    required this.clouds,
    required this.name,
  });

  factory WetherModel.fromJson(Map<String, dynamic> json) => WetherModel(
    weather: List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
    main: Main.fromJson(json["main"]),
    wind: Wind.fromJson(json["wind"]),
    clouds: Clouds.fromJson(json["clouds"]),
    name: json["name"],
  );
}



class Clouds {
  int? all;
  Clouds({
    required this.all,
  });

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
    all: json["all"],
  );

  Map<String, dynamic> toJson() => {
    "all": all,
  };
}


class Main {
  int? temp;
  int? tempMin;
  int? tempMax;
  int? humidity;

  Main({
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.humidity,
  });

  factory Main.fromJson(Map<String, dynamic> json) => Main(
    temp: json["temp"]?.toInt(),
    tempMin: json["temp_min"]?.toInt(),
    tempMax: json["temp_max"]?.toInt(),
    humidity: json["humidity"],
  );

  Map<String, dynamic> toJson() => {
    "temp": temp,
    "temp_min": tempMin,
    "temp_max": tempMax,
    "humidity": humidity,
  };
}


class Weather {
  String main;
  String icon;

  Weather({
    required this.main,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
    main: json["main"],
    icon: json["icon"],
  );
}

class Wind {
  int speed;
  int deg;

  Wind({
    required this.speed,
    required this.deg,
  });

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
    speed: json["speed"]?.toInt(),
    deg: json["deg"],
  );

  Map<String, dynamic> toJson() => {
    "speed": speed,
    "deg": deg,
  };
}
