import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_flutter/core/app_colors.dart';
import 'package:weather_app_flutter/modules/home/controller/home_controller.dart';

class WeatherTextField extends StatelessWidget {
  const WeatherTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: Get.find<HomeController>().focusNode,
      controller: Get.find<HomeController>().cityTextFieldController,
      validator: (value) {
        if (Get.find<HomeController>().cityTextFieldController.text.isEmpty) {
          return "Please enter a city";
        }
        return null;
      },
      //  Get.find<HomeController>().isWeatherDataLoaded.value == true
      keyboardType: TextInputType.text,
      //  cursorColor: ThemeColors.primaryColor,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          borderSide: BorderSide(color: Colors.white),
        ),
        //contentPadding: EdgeInsets.all(8),
        labelText: 'Enter city',
        labelStyle: TextStyle(color: AppColors.colorPrimary, fontSize: 15),
        hintText: 'Enter city name',
        hintStyle: TextStyle(
            color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w300),
        /* suffixIcon: IconButton(
          color: AppColors.colorPrimary,
          onPressed: () {
                Get.find<HomeController>().showWeather(
                Get.find<HomeController>().cityTextFieldController.text);
          },
              icon: Icon(Icons.search_outlined),
        ),*/
        fillColor: Colors.black,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              bottomLeft: Radius.circular(25),
              topRight: Radius.zero,
              bottomRight: Radius.zero),
          borderSide: BorderSide(
            color: AppColors.colorPrimary,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              bottomLeft: Radius.circular(25),
              topRight: Radius.circular(25),
              bottomRight: Radius.circular(25)),
          borderSide: BorderSide(
            width: 0.2,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
