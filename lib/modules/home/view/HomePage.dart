import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:weather_app_flutter/core/app_colors.dart';
import 'package:weather_app_flutter/modules/home/controller/home_controller.dart';
import 'package:weather_app_flutter/modules/home/widget/weather_text_field.dart';
import '../widget/weather_data_output.dart';

class HomePage extends StatelessWidget {
  final String title;

  HomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.colorPrimary,
        title: Text(title),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _getInputSection(context),
            SizedBox(
              height: 10,
            ),
            Obx(() =>
                Get.find<HomeController>().isWeatherDataLoaded.value == true
                    ? WeatherDataOutput(
                        weather: Get.find<HomeController>().weather!)
                    : Container())
          ],
        ),
      ),
    );
  }

  _getInputSection(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 16.0),
        child: Container(
            height: 40,
            width: MediaQuery.of(context).size.width,
            child: WeatherTextField()));
  }
}
