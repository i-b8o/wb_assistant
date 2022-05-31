import 'package:flutter/material.dart';

import 'package:wb_assistant/constants.dart';

import 'package:wb_assistant/views/home/home.dart';

class App extends StatefulWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      // case AppLifecycleState.inactive:
      //   print('appLifeCycleState inactive');
      //   break;
      case AppLifecycleState.resumed:
        print('appLifeCycleState resumed');
        setState(() {});
        break;
      // case AppLifecycleState.paused:
      //   print('appLifeCycleState paused');
      //   break;
      // case AppLifecycleState.detached:
      //   print('appLifeCycleState detached');
      //   break;
    }
  }

  @override
  Widget build(BuildContext context) {
    print("App build");
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Constants.bgColor,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: Constants.btnColor,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
