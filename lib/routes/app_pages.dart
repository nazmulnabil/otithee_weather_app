import 'package:get/get.dart';
import 'package:weather_app_flutter/modules/home/data/bindings/home_page_binding.dart';
import 'package:weather_app_flutter/modules/home/ui/view/HomePage.dart';


part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.MAIN;

  static final routes = [
    GetPage(
      name: _Paths.MAIN,
      page: () => HomePage(),
      binding: HomePageBinding(),
    ),
  ];
}
