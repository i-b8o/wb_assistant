import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wb_assistant/controllers/authentication_controller.dart';

import '../../constants.dart';
import '../components/components.dart';
import '../sign_in/sign_in.dart';

class SignUpLarge extends StatelessWidget {
  const SignUpLarge({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("SignUpLarge");
    double width = MediaQuery.of(context).size.width;
    return BodyLarge(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: width * 0.03,
          ),
          AlreadyHaveAnAccountCheck(
            onPressed: () =>
                Get.to(() => const SignInPage(), transition: Transition.fadeIn),
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
                  onChanged: (username) =>
                      Get.find<AuthenticationController>().username = username,
                  height: width * 0.05,
                  width: width * 0.3),
              RoundedInputField(
                  mobile: false,
                  hintText: Constants.emailInputText,
                  onChanged: (email) =>
                      Get.find<AuthenticationController>().email = email,
                  height: width * 0.05,
                  width: width * 0.3),
              RoundedPasswordField(
                mobile: false,
                onChanged: (password) =>
                    Get.find<AuthenticationController>().password = password,
                height: width * 0.05,
                width: width * 0.3,
              )
            ],
          ),
          WelcomeBtns(
            mobile: false,
            signIn: false,
            btnText: Constants.regBtnText,
            onPressed: Get.find<AuthenticationController>().onSignUpBtnPressed,
          ),
        ],
      ),
    );
  }
}
