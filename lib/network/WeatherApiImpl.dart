import 'package:weather_app_flutter/config/build_config.dart';
import 'package:weather_app_flutter/network/WeatherApi.dart';
import 'package:weather_app_flutter/network/dio_client.dart';

import '../modules/home/model/weather_data.dart';
import '../modules/home/model/weather_response.dart';

class WeatherApiImpl extends WeatherApi {
  var logger = BuildConfig.instance.config.logger;

  @override
  Future<WeatherData>? getWeatherInfo(String? cityName) {
    return _getWeather(cityName);
  }

  Future<WeatherData> _getWeather(String? cityName) async {
    try {
      var dioClient = DioClient().client;
      print('>>>>>>>>>>>>>>>$cityName');
      var response = await dioClient.get(
        '/weather',
        queryParameters: {'q': cityName},
      );

      logger.i("city Response body JSON:\n$response");

      WeatherResponse weatherResponse = WeatherResponse.fromJson(response.data);

      logger.i("Response body JSON:\n$weatherResponse");

      WeatherData weatherData = weatherResponse.toWeatherData();
      print(weatherData.cityAndCountry);

      print("from network $weatherData");

      return weatherData;
    } catch (e) {
      throw e;
    }
  }
}
