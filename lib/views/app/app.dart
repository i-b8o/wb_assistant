import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wb_assistant/controllers/authentication_controller.dart';
import 'package:wb_assistant/views/home/home.dart';

import '../../controllers/local_storage_controller.dart';

import '../welcome/welcome.dart';

class App extends StatelessWidget {
  App({
    Key? key,
  }) : super(key: key);

  final AuthenticationController authenticationController =
      Get.put(AuthenticationController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LocalStorageController.jwtInStorage.isTrue
          ? const Home()
          : const WelcomePage(),
    );
  }
}
