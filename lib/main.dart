import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'simple_bloc_observer.dart';
import 'views/app/app.dart';

Future<void> main() async {
  BlocOverrides.runZoned(
    () => runApp(App()),
    blocObserver: SimpleBlocObserver(),
  );
}
