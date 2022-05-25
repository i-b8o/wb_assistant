import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wb_assistant/views/confirm/confirm_email.dart';

import '../../constants.dart';
import '../../controllers/authentication_controller.dart';
import '../components/components.dart';
import '../sign_in/sign_in.dart';

// TODO use MediaQueryData widget
class SignUpPortrait extends StatelessWidget {
  const SignUpPortrait({Key? key, required this.controller}) : super(key: key);
  final AuthenticationController controller;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Constants.bgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const WelcomeHeader(
            headerText: Constants.signUpHeaderText,
            greetingText: Constants.signUpGreetingText,
          ),
          Column(
            children: [
              TextFieldsWidget(
                fields: [
                  RoundedInputField(
                      email: false,
                      hintText: Constants.nameInputText,
                      onChanged: (username) => controller.username = username,
                      height: width * 0.15,
                      width: width * 0.85),
                  RoundedInputField(
                      hintText: Constants.emailInputText,
                      onChanged: (email) => controller.email = email,
                      height: width * 0.15,
                      width: width * 0.85),
                  RoundedPasswordField(
                    onChanged: (password) => controller.password = password,
                    height: width * 0.15,
                    width: width * 0.85,
                  )
                ],
              ),
              WelcomeBtns(
                onPressed: controller.onSignUpBtnPressed,
                signIn: false,
                btnText: Constants.regBtnText,
              ),
            ],
          ),
          SizedBox(
            height: width * 0.2,
          ),
          AlreadyHaveAnAccountCheck(
            onPressed: () =>
                Get.to(() => const SignInPage(), transition: Transition.fadeIn),
            signIn: false,
            fontSize: width * 0.03,
          ),
        ],
      ),
    );
  }
}
