import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'simple_bloc_observer.dart';
import 'views/app/app.dart';

// TODO Automatically count returns average price (65 + 33) in dependence of income number
// TODO After signIn pop signPage
Future<void> main() async {
  BlocOverrides.runZoned(
    () => runApp(App()),
    blocObserver: SimpleBlocObserver(),
  );
}
