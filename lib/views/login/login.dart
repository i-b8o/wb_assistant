import 'package:flutter/material.dart';

import '../../constants.dart';
import '../components/responsive_widget.dart';
import 'login_landscape.dart';
import 'login_portrait.dart';
import 'login_thick_portrait.dart';

// TODO creaye forgot password page
class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Constants.bgColor,
      body: SizedBox(
          width: double.infinity,
          height: size.height,
          child: const ResponsiveWidget(
            portrait: LoginPortrait(),
            thickPortrait: LoginThickPortrait(),
            landscape: LoginLandscape(),
          )),
    );
  }
}
