import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../controllers/authentication_controller.dart';
import '../app/app.dart';
import '../components/already_have_an_account_check.dart';
import '../components/rounded_input_field.dart';
import '../components/rounded_password_field.dart';
import '../components/welcome_btns.dart';
import '../components/welcome_header.dart';
import '../components/welcome_text_fields.dart';

import '../registration/registration_page.dart';

class LoginPortrait extends StatelessWidget {
  const LoginPortrait({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        const WelcomeHeader(
            headerText: Constants.loginHeaderText,
            greetingText: Constants.loginGreetingText),
        GetBuilder<AuthenticationController>(builder: (controller) {
          return Column(
            children: [
              TextFieldsWidget(
                fields: [
                  RoundedInputField(
                      hintText: Constants.emailInputText,
                      onChanged: (value) {
                        controller.email = value;
                      },
                      height: _size.width * 0.15,
                      width: _size.width * 0.85),
                  RoundedPasswordField(
                    onChanged: (value) {
                      controller.password = value;
                    },
                    height: _size.width * 0.15,
                    width: _size.width * 0.85,
                  ),
                  WelcomeBtns(
                    onPressed: () async {
                      String mes = await controller.log();
                      if (mes == "") {
                        Get.to(() => App());
                      }
                      Get.snackbar("Ошибка", mes);
                    },
                    btnText: Constants.logBtnText,
                  ),
                  SizedBox(
                    height: _size.height * 0.04,
                  ),
                  AlreadyHaveAnAccountCheck(
                    onPressed: () => Get.to(() => const RegistrationPage(),
                        transition: Transition.fadeIn),
                    fontSize: _size.width * 0.03,
                  ),
                ],
              ),
            ],
          );
        }),
        SizedBox(
          height: _size.width * 0.4,
        ),
        AlreadyHaveAnAccountCheck(
          onPressed: () => Get.to(() => const RegistrationPage(),
              transition: Transition.fadeIn),
          fontSize: _size.width * 0.03,
        ),
      ],
    );
  }
}
