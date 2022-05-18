import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../controllers/authentication_controller.dart';
import '../components/components.dart';
import '../confirm/confirm_email.dart';
import '../login/login.dart';

// TODO use MediaQueryData widget
class RegistrationPortrait extends StatelessWidget {
  const RegistrationPortrait({Key? key}) : super(key: key);

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
            headerText: Constants.registrationHeaderText,
            greetingText: Constants.registrationGreetingText,
          ),
          GetBuilder<AuthenticationController>(
            init: AuthenticationController(),
            initState: (_) {},
            builder: (controller) {
              return Column(
                children: [
                  TextFieldsWidget(
                    fields: [
                      RoundedInputField(
                          email: false,
                          hintText: Constants.nameInputText,
                          onChanged: (username) => controller.name = username,
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
                  // TODO Create the ConfirmMail Page and perform transition to the confirm mail page with autmatic transition to Login
                  WelcomeBtns(
                    onPressed: () => controller.regOnPressed(),
                    login: false,
                    btnText: Constants.regBtnText,
                  ),
                ],
              );
            },
          ),
          SizedBox(
            height: width * 0.2,
          ),
          AlreadyHaveAnAccountCheck(
            onPressed: () =>
                Get.to(() => const LoginPage(), transition: Transition.fadeIn),
            login: false,
            fontSize: width * 0.03,
          ),
        ],
      ),
    );
  }
}
