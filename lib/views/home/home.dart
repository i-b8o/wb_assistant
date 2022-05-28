import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wb_assistant/controllers/local_storage_controller.dart';
import 'package:wb_assistant/views/confirm/confirm_email.dart';

import '../../models/details.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return FutureBuilder<Details>(
        future: LocalStorageController.loadDetails(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Details details = snapshot.data as Details;
            if (details.type == "none") {
              return const ConfirmEmailPage();
            }
            return Container(
              color: Colors.blue,
              child: Column(
                children: [
                  Text(
                    "email: ${details.email}",
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    "expires: ${details.expires}",
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    "id: ${details.id}",
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    "type: ${details.type}",
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    "username: ${details.username}",
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            );
          }
          String jwt = LocalStorageController.jwtToken;
          Get.find<LocalStorageController>().getAndSaveDetails(jwt);
          return Container(
            color: Colors.blue,
            child: Center(
                child: Padding(
              padding: EdgeInsets.all(size.width * 0.8),
              child: const CircularProgressIndicator(
                color: Colors.red,
              ),
            )),
          );
        });
  }

  Scaffold errorView(AsyncSnapshot<Object?> snapshot) {
    return Scaffold(body: Center(child: Text('Error: ${snapshot.error}')));
  }
}
