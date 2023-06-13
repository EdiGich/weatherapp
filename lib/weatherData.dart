// ignore_for_file: file_names, avoid_print




import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/weatherModel.dart';

class WeatherData {
  Future<Weather?> getData(double latitude, double longitude) async {
    try {
      var uriCall = Uri.parse(
      'http://api.weatherapi.com/v1/current.json?key=477698c720e84d3cacc103205230304&q=$latitude,$longitude&aqi=no');
      var response = await http.get(uriCall);
      var body = jsonDecode(response.body);
      return Weather.fromJSon(body);
      } catch (e) {
        print('Error occurred: $e');
        return null;
      }
  }
}