import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wb_assistant/controllers/authentication_controller.dart';
import 'package:wb_assistant/views/home/home.dart';
import 'package:wb_assistant/views/password_recovery/password_recovery.dart';

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
      home: PasswordRecoveryPage(),
      // LocalStorageController.jwtInStorage.isTrue &&
      //         LocalStorageController.detailsInStorage.isTrue
      //     ? const Home()
      //     : const WelcomePage(),
    );
  }
}
