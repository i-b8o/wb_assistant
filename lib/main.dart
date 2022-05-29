import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'controllers/all_controller_binding.dart';
import 'views/app/app.dart';

Future<void> main() async {
  await GetStorage.init();
  AllControllerBinding();
  runApp(const App());
}
