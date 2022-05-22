import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wb_assistant/controllers/authentication_controller.dart';

import '../../controllers/local_storage_controller.dart';

import '../wait_loading_details_page/wait_loading_details_page.dart';

import '../wait_loading_sign_in_page/wait_loading_sign_in_page.dart';

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
      home: localStorageController.jwtInStorage.isTrue
          ? const WaitLoadingDetailsPage()
          : localStorageController.credentialsInStorage.isTrue
              ? const WaitLoadingSignInPage()
              : const WelcomePage(),
    );
  }
}
