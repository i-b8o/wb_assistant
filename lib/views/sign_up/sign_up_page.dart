import 'package:flutter/material.dart';
import '../../constants.dart';
import 'landscape/sign_up_landscape.dart';
import 'portrait/sign_up_portrait.dart';
import 'thick_portrait/sign_up_thick_portrait.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('SignUpPage');
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Constants.bgColor,
      body: SizedBox(
          width: double.infinity,
          height: size.height,
          child: LayoutBuilder(
            builder: (context, constraints) {
              bool isPortrait =
                  MediaQuery.of(context).orientation == Orientation.portrait;
              double aspectRatio = constraints.maxWidth / constraints.maxHeight;
              if (isPortrait) {
                return aspectRatio > 0.55
                    ? const SignUpThickPortrait()
                    : const SignUpPortrait();
              } else {
                return const SignUpLandscape();
              }
            },
          )),
    );
  }
}
