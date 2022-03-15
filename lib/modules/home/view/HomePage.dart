import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:weather_app_flutter/core/app_colors.dart';
import 'package:weather_app_flutter/modules/home/controller/home_controller.dart';
import '../widget/input_section.dart';
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

           InputSection(),
            SizedBox(
              height: 10,
            ),
            Obx(() {



            if ( Get.find<HomeController>().isWeatherDataLoaded.value == true)
                 return  WeatherDataOutput(
                  weather: Get.find<HomeController>().weather!);
                  else{return Container();}
            }

            )
          ],
        ),
      ),
    );
  }


}
