import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../controllers/authentication_controller.dart';
import '../components/responsive_widget.dart';
import 'sign_in_landscape.dart';
import 'sign_in_portrait.dart';
import 'sign_in_thick_portrait.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("SignInPage");
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Constants.bgColor,
      body: SizedBox(
          width: double.infinity,
          height: size.height,
          child: ResponsiveWidget(
            portrait: SignInPortrait(),
            thickPortrait: SignInThickPortrait(),
            landscape: SignInLandscape(),
          )),
    );
  }
}
