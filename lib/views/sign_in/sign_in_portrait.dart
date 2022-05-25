import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../controllers/authentication_controller.dart';

import '../components/already_have_an_account_check.dart';
import '../components/rounded_input_field.dart';
import '../components/rounded_password_field.dart';
import '../components/welcome_btns.dart';
import '../components/welcome_header.dart';
import '../components/welcome_text_fields.dart';
import '../sign_up/sign_up_page.dart';

class SignInPortrait extends StatelessWidget {
  const SignInPortrait({Key? key, required this.controller}) : super(key: key);

  final AuthenticationController controller;
  @override
  Widget build(BuildContext context) {
    print("SignInPortrait");
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const WelcomeHeader(
            headerText: Constants.signInHeaderText,
            greetingText: Constants.signInGreetingText),
        Column(
          children: [
            TextFieldsWidget(
              fields: [
                RoundedInputField(
                    hintText: Constants.emailInputText,
                    onChanged: (value) {
                      controller.email = value;
                    },
                    height: size.width * 0.15,
                    width: size.width * 0.85),
                RoundedPasswordField(
                  onChanged: (value) {
                    controller.password = value;
                  },
                  height: size.width * 0.15,
                  width: size.width * 0.85,
                ),
                WelcomeBtns(
                  onPressed: () => controller.onSignInBtnPressed(),
                  btnText: Constants.logBtnText,
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                AlreadyHaveAnAccountCheck(
                  onPressed: () => Get.to(() => const SignUpPage(),
                      transition: Transition.fadeIn),
                  fontSize: size.width * 0.03,
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: size.width * 0.4,
        ),
        AlreadyHaveAnAccountCheck(
          onPressed: () =>
              Get.to(() => const SignUpPage(), transition: Transition.fadeIn),
          fontSize: size.width * 0.03,
        ),
      ],
    );
  }
}
