import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wb_assistant/controllers/all_controller_binding.dart';
import 'package:wb_assistant/controllers/authentication_controller.dart';
import 'package:wb_assistant/views/home/home.dart';
import 'package:wb_assistant/views/password_recovery/password_recovery.dart';
import 'package:wb_assistant/views/sign_in/sign_in.dart';

import '../../controllers/local_storage_controller.dart';

import '../welcome/welcome.dart';

class App extends StatelessWidget {
  App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AllControllerBinding(),
      debugShowCheckedModeBanner: false,
      home: LocalStorageController.jwtInStorage.isTrue &&
              Get.find<LocalStorageController>().detailsInStorage.isTrue
          ? const Home()
          : const WelcomePage(),
    );
  }
}
