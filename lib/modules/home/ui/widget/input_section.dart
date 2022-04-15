import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_flutter/core/app_strings.dart';
import 'package:weather_app_flutter/core/app_values.dart';
import 'package:weather_app_flutter/modules/home/data/controller/home_controller.dart';
import 'package:weather_app_flutter/modules/home/ui/widget/weather_text_field.dart';
import 'custom_elevated_button.dart';

class InputSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: AppValues.weatherTexFieldHeight,
            width: MediaQuery.of(context).size.width,
            child: WeatherTextField()),
        SizedBox(
          height: AppValues.padding,
        ),
        ElevatedCustomButton(
            buttonHeight: AppValues.padding,
            text: AppStrings.searchButtonText,
            function: () {
              FocusManager.instance.primaryFocus?.unfocus();
              Get.find<HomeController>().showWeather(Get.find<HomeController>()
                  .cityTextFieldController
                  .text
                  .trim());
            })
      ],
    );
  }
}
