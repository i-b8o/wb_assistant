import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wb_assistant/controllers/local_storage_controller.dart';
import 'package:wb_assistant/views/confirm/confirm_email.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GetX<LocalStorageController>(builder: (controller) {
      controller.fetchDetails();
      print("I am here!");
      if (controller.isLoading.value) {
        print("I am here now!");
        return Center(
          child: CircularProgressIndicator(
            color: Colors.deepPurple[600],
          ),
        );
      }

      var type = controller.type;
      print("Type $type");
      if (type.value == "none") {
        return const ConfirmEmailPage();
      } else if (type.value == "end") {
        return const Center(
          child: Text("Просрочен"),
        );
      }
      return Container(
        color: Colors.blue,
        child: Column(
          children: [
            Text(
              "email: ${controller.email}",
              style: const TextStyle(color: Colors.white),
            ),
            Text(
              "expires: ${controller.expires}",
              style: const TextStyle(color: Colors.white),
            ),
            Text(
              "id: ${controller.id}",
              style: const TextStyle(color: Colors.white),
            ),
            Text(
              "type: ${controller.type}",
              style: const TextStyle(color: Colors.white),
            ),
            Text(
              "username: ${controller.username}",
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      );
    });
  }

  Scaffold errorView(AsyncSnapshot<Object?> snapshot) {
    return Scaffold(body: Center(child: Text('Error: ${snapshot.error}')));
  }
}
