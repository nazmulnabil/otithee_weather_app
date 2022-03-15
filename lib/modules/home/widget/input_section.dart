import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_flutter/modules/home/widget/weather_text_field.dart';


import '../controller/home_controller.dart';
import 'custom_elevated_button.dart';


class InputSection extends StatelessWidget {


  @override
  Widget build(BuildContext context) {


    return Column(
      children: [
        SizedBox(
            height: 40,
            width: MediaQuery.of(context).size.width,
            child: WeatherTextField()),
            ElevatedCustomButton(buttonHeight: 10,text: "Search",
            function:() {
              FocusManager.instance.primaryFocus?.unfocus();
              Get.find<HomeController>().showWeather(Get.find<HomeController>().cityTextFieldController.text.trim());

            })

      ],
    );
  }


}
