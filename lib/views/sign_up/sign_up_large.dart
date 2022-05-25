import 'package:flutter/material.dart';
import 'package:wb_assistant/controllers/authentication_controller.dart';

import '../../constants.dart';
import '../components/components.dart';

class SignUpLarge extends StatelessWidget {
  const SignUpLarge({Key? key, required this.controller}) : super(key: key);
  final AuthenticationController controller;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return BodyLarge(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: width * 0.03,
          ),
          AlreadyHaveAnAccountCheck(
            signIn: false,
            mobile: false,
            fontSize: width * 0.01,
          ),
          const WelcomeHeader(
            mobile: false,
            headerText: Constants.signUpHeaderText,
            greetingText: Constants.signUpGreetingText,
          ),
          TextFieldsWidget(
            fields: [
              RoundedInputField(
                  mobile: false,
                  email: false,
                  hintText: Constants.nameInputText,
                  onChanged: (s) {},
                  height: width * 0.05,
                  width: width * 0.3),
              RoundedInputField(
                  mobile: false,
                  hintText: Constants.emailInputText,
                  onChanged: (s) {},
                  height: width * 0.05,
                  width: width * 0.3),
              RoundedPasswordField(
                mobile: false,
                onChanged: (s) {},
                height: width * 0.05,
                width: width * 0.3,
              )
            ],
          ),
          WelcomeBtns(
            mobile: false,
            signIn: false,
            btnText: Constants.regBtnText,
            onPressed: controller.onSignUpBtnPressed,
          ),
        ],
      ),
    );
  }
}
