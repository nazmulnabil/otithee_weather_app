import 'package:weather_app_flutter/config/build_config.dart';
import 'package:weather_app_flutter/modules/home/data/model/weather_data.dart';
import 'package:weather_app_flutter/modules/home/data/model/weather_response.dart';
import 'package:weather_app_flutter/network/dio_client.dart';

import 'WeatherApi.dart';


class WeatherApiImpl extends WeatherApi {
  var logger = BuildConfig.instance.config.logger;

  @override
  Future<WeatherData>? getWeatherInfo(String? cityName) {
    return _getWeather(cityName);
  }

  Future<WeatherData> _getWeather(String? cityName) async {
    try {
      var dioClient = DioClient().client;
      print('weatherImpl >>>>>>>>>>>>>>>$cityName');
      var response = await dioClient.get(
        '/weather',
        queryParameters: {'q': cityName},
      );

      print('!!!!!! $response');
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
