import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wb_assistant/controllers/local_storage_controller.dart';
import 'package:wb_assistant/views/confirm/confirm_email.dart';

import '../../models/details.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Home");
    Size size = MediaQuery.of(context).size;
    return GetBuilder<LocalStorageController>(
      init: LocalStorageController(),
      initState: (_) {},
      builder: (controller) {
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
                      Text(details.email),
                      Text(details.expires),
                      Text(details.id),
                      Text(details.type),
                      Text(details.username),
                    ],
                  ),
                );
              }
              return Container(
                color: Colors.blue,
                child: Center(
                    child: Padding(
                  padding: EdgeInsets.all(size.width * 0.8),
                  child: const CircularProgressIndicator(),
                )),
              );
            });
      },
    );
  }

  Scaffold errorView(AsyncSnapshot<Object?> snapshot) {
    return Scaffold(body: Center(child: Text('Error: ${snapshot.error}')));
  }
}
