import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wb_assistant/constants.dart';
import 'package:wb_assistant/controllers/all_controller_binding.dart';
import 'package:wb_assistant/views/home/home.dart';

import '../../controllers/local_storage_controller.dart';

import '../welcome/welcome.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Constants.bgColor,
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              primary: Constants.btnColor,
            ),
          ),
        ),
        initialBinding: AllControllerBinding(),
        debugShowCheckedModeBanner: false,
        home: GetX<LocalStorageController>(builder: (controller) {
          print(
              "App: ${LocalStorageController.jwtInStorage.isTrue} <==> ${controller.detailsInStorage.isTrue}");
          return LocalStorageController.jwtInStorage.isTrue &&
                  controller.detailsInStorage.isTrue
              ? const Home()
              : const WelcomePage();
        }));
  }
}
