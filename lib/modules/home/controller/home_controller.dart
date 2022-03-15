import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../network/WeatherApi.dart';
import '../../../network/WeatherApiImpl.dart';
import '../model/City.dart';
import '../model/weather_data.dart';

class HomeController extends GetxController {
  List<City> cityList = [];
  City? selectedCity;
  RxBool isWeatherDataLoaded = false.obs;
  WeatherData? weather;
  late WeatherApi weatherApi;
  TextEditingController _cityTextFieldController = TextEditingController();

  TextEditingController get cityTextFieldController => _cityTextFieldController;
  FocusNode focusNode = FocusNode();

  @override
  void onInit() {
    weatherApi = WeatherApiImpl();
    focusNode.addListener(() {
      if (focusNode.hasFocus) isWeatherDataLoaded.value = false;
    });
  }

  Future<WeatherData?> showWeather(String? cityName) async {
    try {
      print("inside controller >>>>>>>>>. $cityName");
      var weatherTemp = await weatherApi.getWeatherInfo(cityName);
     // print(weatherTemp);
      weather = weatherTemp;
      isWeatherDataLoaded.value = true;
      print(isWeatherDataLoaded.value);
      update();
      print("inside controller");
      return weather;
    } catch (e) {
      //showSnackBar(context, e.toString(), type: SnackBarType.ERROR);

    }
    return null;
  }
}
