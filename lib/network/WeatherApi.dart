import '../modules/home/model/weather_data.dart';

abstract class WeatherApi {
  Future<WeatherData>? getWeatherInfo(String? cityName);
}
