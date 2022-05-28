import 'package:flutter/material.dart';
import '../../constants.dart';
import '../components/responsive_widget.dart';
import 'landscape/sign_in_landscape.dart';
import 'portrait/sign_in_portrait.dart';
import 'thick_portrait/sign_in_thick_portrait.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("SignInPage");
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
