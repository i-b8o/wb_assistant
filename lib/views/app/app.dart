import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wb_assistant/controllers/authentication_controller.dart';

import '../../controllers/local_storage_controller.dart';

import '../home/home.dart';
import '../welcome/welcome.dart';

class App extends StatelessWidget {
  App({
    Key? key,
  }) : super(key: key);
  final LocalStorageController localStorageController =
      Get.put(LocalStorageController());
  final AuthenticationController authenticationController =
      Get.put(AuthenticationController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: localStorageController.userDataStored.isTrue
          ? const Home()
          // : const ConfirmEmailPage()
          : const WelcomePage(),
    );
  }
}
