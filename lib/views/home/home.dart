import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wb_assistant/controllers/authentication_controller.dart';
import 'package:wb_assistant/controllers/local_storage_controller.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  Future<void> initializeSettings(
      AuthenticationController aController, String jwt) async {
    String message = await aController.getDetails(jwt);
    if (message.isNotEmpty) {
      Get.snackbar(
        "Снак",
        message,
        icon: const Icon(Icons.person, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthenticationController>(
        init: AuthenticationController(),
        builder: (authController) {
          return FutureBuilder(
            future: initializeSettings(
                authController, LocalStorageController.jwtToken),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (snapshot.hasError) {
                  return errorView(snapshot);
                } else {
                  return Container(
                    color: Colors.amber,
                    child: Column(children: [
                      Text("Email: ${authController.details.email}|"),
                      Text("expires:${authController.details.expires}|"),
                      Text("type:${authController.details.type}|"),
                      Text("username:${authController.details.username}|"),
                    ]),
                  );
                }
              }
            },
          );
        });
  }

  Scaffold errorView(AsyncSnapshot<Object?> snapshot) {
    return Scaffold(body: Center(child: Text('Error: ${snapshot.error}')));
  }
}
