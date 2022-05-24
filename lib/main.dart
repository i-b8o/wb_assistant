import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'views/app/app.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(App());
}
