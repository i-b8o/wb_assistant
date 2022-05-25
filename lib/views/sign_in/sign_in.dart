import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../controllers/authentication_controller.dart';
import '../components/responsive_widget.dart';
import 'sign_in_landscape.dart';
import 'sign_in_portrait.dart';
import 'sign_in_thick_portrait.dart';

// TODO create forgot password page
class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Constants.bgColor,
      body: GetBuilder<AuthenticationController>(
        init: AuthenticationController(),
        initState: (_) {},
        builder: (controller) {
          return SizedBox(
              width: double.infinity,
              height: size.height,
              child: ResponsiveWidget(
                portrait: SignInPortrait(controller: controller),
                thickPortrait: SignInThickPortrait(controller: controller),
                landscape: SignInLandscape(controller: controller),
              ));
        },
      ),
    );
  }
}
