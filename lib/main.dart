import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:weather_app_flutter/config/build_config.dart';
import 'package:weather_app_flutter/config/env_config.dart';
import 'package:weather_app_flutter/core/app_strings.dart';
import 'package:weather_app_flutter/routes/app_pages.dart';



Future<void> main() async {
  var logger = Logger();
  WidgetsFlutterBinding.ensureInitialized();
  try {
    EnvConfig config = await getConfig();
    BuildConfig.instantiate(envConfig: config);
    runApp(MyApp());
  } catch (e) {
    logger.e(e);
  }
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();

      },
      child: GetMaterialApp(
        title: AppStrings.appTitle,
        theme: ThemeData(primarySwatch: Colors.teal),
       // home: HomePage(),
        initialRoute: AppPages.INITIAL,
        getPages:AppPages.routes,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

Future<EnvConfig> getConfig() async {
  var logger = Logger();
  try {
    String configString = await rootBundle.loadString(AppStrings.configJson);
    final configJson = await json.decode(configString) as Map<String, dynamic>;

    String baseUrl = configJson[AppStrings.baseUrl];
    String appId = configJson[AppStrings.appId];

    if (baseUrl.isEmpty || appId.isEmpty)
      logger.e(AppStrings.baseUrlAppIdConfigMsg);

    return EnvConfig(
      baseUrl: baseUrl,
      appId: appId,
    );
  } catch (e) {
    throw Exception('$e\n${AppStrings.localConfigMsg}');
  }
}
