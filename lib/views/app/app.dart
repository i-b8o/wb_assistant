import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:wb_assistant/constants.dart';

import 'package:wb_assistant/views/home/home.dart';
import 'package:wb_assistant/views/welcome/welcome.dart';

import '../../bloc/app/app_bloc.dart';

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
    return BlocProvider(
      create: (context) => AppBloc()..add(AuthRequest()),
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Constants.bgColor,
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              primary: Constants.btnColor,
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<AppBloc, AppState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            if (state is AppLoadInProgressState) {
              return const CircularProgressIndicator.adaptive(
                backgroundColor: Colors.pink,
              );
            } else if (state is AppTokenNotFound) {
              return const WelcomePage();
            } else if (state is AppSignInSuccessState) {
              return Home(user: state.user);
            }
            return ErrorWidget(Exception);
          },
        ),
      ),
    );
  }
}
