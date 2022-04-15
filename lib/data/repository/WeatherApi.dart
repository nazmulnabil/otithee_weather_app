
import 'package:weather_app_flutter/modules/home/data/model/weather_data.dart';

abstract class WeatherApi {
  Future<WeatherData>? getWeatherInfo(String? cityName);
}
