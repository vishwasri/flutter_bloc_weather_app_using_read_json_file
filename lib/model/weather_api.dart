// To parse this JSON data, do
//
//     final weatherApi = weatherApiFromJson(jsonString);

import 'dart:convert';

WeatherApi weatherApiFromJson(String str) =>
    WeatherApi.fromJson(json.decode(str));

String weatherApiToJson(WeatherApi data) => json.encode(data.toJson());

class WeatherApi {
  WeatherApi({
    this.cnt,
    this.list,
  });

  final int cnt;
  final List<CityData> list;

  factory WeatherApi.fromJson(Map<String, dynamic> json) => WeatherApi(
        cnt: json["cnt"],
        list:
            List<CityData>.from(json["list"].map((x) => CityData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "cnt": cnt,
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
      };
}

class CityData {
  CityData({
    this.weather,
    this.main,
    this.visibility,
    this.dt,
    this.id,
    this.name,
  });

  final List<Weather> weather;
  final Main main;
  final int visibility;
  final int dt;
  final int id;
  final String name;

  factory CityData.fromJson(Map<String, dynamic> json) => CityData(
        weather:
            List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        main: Main.fromJson(json["main"]),
        visibility: json["visibility"],
        dt: json["dt"],
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
        "main": main.toJson(),
        "visibility": visibility,
        "dt": dt,
        "id": id,
        "name": name,
      };
}

class Main {
  Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
  });

  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final double pressure;
  final double humidity;

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: json["temp"].toDouble(),
        feelsLike: json["feels_like"].toDouble(),
        tempMin: json["temp_min"].toDouble(),
        tempMax: json["temp_max"].toDouble(),
        pressure: json["pressure"].toDouble(),
        humidity: json["humidity"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "pressure": pressure,
        "humidity": humidity,
      };
}

class Weather {
  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  final int id;
  final String main;
  final String description;
  final String icon;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"],
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
      };
}
