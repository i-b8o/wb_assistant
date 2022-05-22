import 'package:flutter/material.dart';

import '../../constants.dart';
import '../components/responsive_widget.dart';
import 'sign_in_landscape.dart';
import 'sign_in_portrait.dart';
import 'sign_in_thick_portrait.dart';

// TODO creaye forgot password page
class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

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
            portrait: SignInPortrait(),
            thickPortrait: SignInThickPortrait(),
            landscape: SignInLandscape(),
          )),
    );
  }
}
