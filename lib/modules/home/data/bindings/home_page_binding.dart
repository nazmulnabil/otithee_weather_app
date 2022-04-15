import 'package:get/get.dart';
import 'package:weather_app_flutter/modules/home/data/controller/home_controller.dart';

class HomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
  }
}
