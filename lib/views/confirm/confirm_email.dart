import 'package:flutter/material.dart';

import '../../constants.dart';
import 'confirm_email_large.dart';
import 'confirm_email_portrait.dart';
import 'confirm_email_thick_portrait.dart';

class ConfirmEmailPage extends StatelessWidget {
  const ConfirmEmailPage({Key? key}) : super(key: key);

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
                  ? const ConfirmEmailThickPortrait()
                  : const ConfirmEmailPortrait();
            } else {
              return const ConfirmEmailLarge();
            }
          },
        ),
      ),
    );
  }
}
