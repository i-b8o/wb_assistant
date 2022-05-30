import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wb_assistant/controllers/local_storage_controller.dart';
import 'package:wb_assistant/views/confirm/confirm_email.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    print("I am here!");
    if (Get.find<LocalStorageController>().isLoading.value) {
      print("I am here now!");
      return Center(
        child: CircularProgressIndicator(
          color: Colors.deepPurple[600],
        ),
      );
    }

    var accType = Get.find<LocalStorageController>().type.value;
    print("Type $accType");
    if (accType == "none") {
      return const ConfirmEmailPage();
    } else if (accType == "end") {
      return const Center(
        child: Text("Просрочен"),
      );
    }
    return Container(
      color: Colors.blue,
      child: Column(
        children: [
          Text(
            "email: ${Get.find<LocalStorageController>().email.value}",
            style: const TextStyle(color: Colors.white),
          ),
          Text(
            "expires: ${Get.find<LocalStorageController>().expires.value}",
            style: const TextStyle(color: Colors.white),
          ),
          Text(
            "id: ${Get.find<LocalStorageController>().id.value}",
            style: const TextStyle(color: Colors.white),
          ),
          Text(
            "type: ${Get.find<LocalStorageController>().type.value}",
            style: const TextStyle(color: Colors.white),
          ),
          Text(
            "username: ${Get.find<LocalStorageController>().username.value}",
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Scaffold errorView(AsyncSnapshot<Object?> snapshot) {
    return Scaffold(body: Center(child: Text('Error: ${snapshot.error}')));
  }
}
