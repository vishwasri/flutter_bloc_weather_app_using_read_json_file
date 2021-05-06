import 'dart:convert';

City cityFromJson(String str) => City.fromJson(json.decode(str));

String cityToJson(City data) => json.encode(data.toJson());

class City {
  City({
    this.cityCode,
    this.cityName,
    this.temp,
    this.status,
  });

  final String cityCode;
  final String cityName;
  final String temp;
  final String status;

  factory City.fromJson(Map<String, dynamic> json) => City(
        cityCode: json["CityCode"],
        cityName: json["CityName"],
        temp: json["Temp"],
        status: json["Status"],
      );

  Map<String, dynamic> toJson() => {
        "CityCode": cityCode,
        "CityName": cityName,
        "Temp": temp,
        "Status": status,
      };
}
