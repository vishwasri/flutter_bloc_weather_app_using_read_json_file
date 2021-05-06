import 'package:flutter/material.dart';
import 'package:hs_test/model/weather_api.dart';
import 'package:hs_test/util/colors.dart';
import 'package:hs_test/util/gradient.dart';

class CityWeather extends StatelessWidget {
  final CityData cityData;

  const CityWeather(this.cityData);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        height: 150,
        width: double.infinity,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: MyGradient.leftToRight(MIDDLE_LIGHT_BLUE, LIGHT_BLUE),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  cityData.name,
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: WHITE,
                  ),
                ),
                Text(
                  cityData.id.toString(),
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: WHITE,
                  ),
                ),
              ],
            ),
            Text(
              cityData.weather[0].main +
                  ' - ' +
                  cityData.weather[0].description,
              style: TextStyle(
                fontSize: 20,
                color: WHITE,
              ),
            ),
            Expanded(
              child: Container(
                child: Text(
                  cityData.main.temp.toString() + " \u2103",
                  style: TextStyle(
                    fontSize: 45,
                    color: WHITE,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
