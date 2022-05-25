import 'package:flutter/material.dart';
import 'package:wb_assistant/views/components/responsive_widget.dart';
import 'package:wb_assistant/views/sign_in/sign_in.dart';

import '../../constants.dart';

import 'welcome_portrait.dart';
import 'welcome_thick_portrait.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Constants.bgColor,
        body: ResponsiveWidget(
          portrait: WelcomePortrait(),
          thickPortrait: WelcomeThickPortrait(),
          landscape: SignInPage(),
        ));
  }
}
