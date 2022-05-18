import 'package:flutter/material.dart';
import '../../constants.dart';
import 'registration_large.dart';
import 'registration_portrait.dart';
import 'registration_thick_portrait.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  ? const RegistrationThickPortrait()
                  : const RegistrationPortrait();
            } else {
              return const RegistrationLarge();
            }
          },
        ),
      ),
    );
  }
}
