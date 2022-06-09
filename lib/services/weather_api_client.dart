import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/constants.dart';
import 'package:weather_app/models/weather.dart';

class WeatherApiClient {
  static const baseUrl = 'http://api.weatherapi.com/v1';
  static const apiKey = WEATHER_API_KEY;

  Future<Weather> fetchCurrentWeather(String city) async {
    final url = Uri.parse('$baseUrl/current.json?key=$apiKey&q=$city&aqi=yes');
    final weatherResponse = await http.get(url);
    if (weatherResponse.statusCode != 200) {
      throw Exception('error getting weather for $city');
    }
    var body = jsonDecode(weatherResponse.body);
    return Weather.fromJson(body);
  }
}
