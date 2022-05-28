import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants.dart';
import '../../controllers/authentication_controller.dart';
import '../components/components.dart';
import '../sign_in/sign_in.dart';

// TODO use MediaQueryData widget
class SignUpPortrait extends StatelessWidget {
  const SignUpPortrait({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('SignUpPortrait');
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
                      onChanged: (username) =>
                          Get.find<AuthenticationController>().username =
                              username,
                      height: width * 0.15,
                      width: width * 0.85),
                  RoundedInputField(
                      hintText: Constants.emailInputText,
                      onChanged: (email) =>
                          Get.find<AuthenticationController>().email = email,
                      height: width * 0.15,
                      width: width * 0.85),
                  RoundedPasswordField(
                    onChanged: (password) =>
                        Get.find<AuthenticationController>().password =
                            password,
                    height: width * 0.15,
                    width: width * 0.85,
                  )
                ],
              ),
              WelcomeBtns(
                onPressed:
                    Get.find<AuthenticationController>().onSignUpBtnPressed,
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
            fontSize: width * 0.04,
          ),
        ],
      ),
    );
  }
}
