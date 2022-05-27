import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wb_assistant/views/password_recovery/password_recovery.dart';

import '../../constants.dart';
import '../../controllers/authentication_controller.dart';
import '../components/already_have_an_account_check.dart';
import '../components/body_large.dart';
import '../components/rounded_input_field.dart';
import '../components/rounded_password_field.dart';
import '../components/welcome_btns.dart';
import '../components/welcome_header.dart';
import '../components/welcome_text_fields.dart';
import '../sign_up/sign_up_page.dart';

// Fields looks bad
class SignInLandscape extends StatelessWidget {
  const SignInLandscape({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final AuthenticationController controller;
  @override
  Widget build(BuildContext context) {
    print('SignInLandscape');
    double width = MediaQuery.of(context).size.width;
    return BodyLarge(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: width * 0.03,
            ),
            AlreadyHaveAnAccountCheck(
              mobile: false,
              fontSize: width * 0.01,
              onPressed: () => Get.to(() => const SignUpPage(),
                  transition: Transition.fadeIn),
            ),
            const WelcomeHeader(
              mobile: false,
              greetingText: Constants.signInGreetingText,
              headerText: Constants.signInHeaderText,
            ),
            TextFieldsWidget(
              fields: [
                RoundedInputField(
                    mobile: false,
                    hintText: Constants.emailInputText,
                    onChanged: (value) {
                      controller.email = value;
                    },
                    height: width * 0.05,
                    width: width * 0.3),
                RoundedPasswordField(
                  mobile: false,
                  onChanged: (value) {
                    controller.password = value;
                  },
                  height: width * 0.05,
                  width: width * 0.3,
                )
              ],
            ),
            WelcomeBtns(
              mobile: false,
              btnText: Constants.logBtnText,
              onPressed: () => controller.onSignInBtnPressed(),
              recoverOnPressed: () => Get.to(() => const PasswordRecoveryPage(),
                  transition: Transition.fadeIn),
            ),
          ],
        ),
      ),
    );
  }
}
