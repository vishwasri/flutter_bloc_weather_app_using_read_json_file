import 'dart:convert' as convert;
import 'dart:developer';

import 'package:hs_test/model/weather_api.dart';
import 'package:hs_test/util/constant.dart';
import 'package:http/http.dart' as http;

class HomeRepository {
  Future<WeatherApi> getSyncStatus(List<String> ids) async {
    String cityIdString = ids.join(',');
    String _url = BASE_URL + "?id=$cityIdString&units=metric&appid=$API_KEY";
    try {
      http.Response response = await http.get(_url, headers: HTTP_HEADERS);
      log(response.body);
      if (response.statusCode == 200) {
        return WeatherApi.fromJson(convert.jsonDecode(response.body));
      } else {
        throw new Exception('Error with api');
      }
    } catch (e) {
      print(e);
      throw new Exception('Could not get data');
    }
  }
}
