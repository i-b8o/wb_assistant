import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants.dart';
import '../../controllers/authentication_controller.dart';
import '../components/already_have_an_account_check.dart';
import '../components/rounded_input_field.dart';
import '../components/rounded_password_field.dart';
import '../components/welcome_btns.dart';

import '../components/welcome_text_fields.dart';
import '../password_recovery/password_recovery.dart';
import '../sign_up/sign_up_page.dart';

class SignInThickPortrait extends StatelessWidget {
  const SignInThickPortrait({Key? key, required this.controller})
      : super(key: key);
  final AuthenticationController controller;
  @override
  Widget build(BuildContext context) {
    print("SignInThickPortrait");
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.1,
        ),
        SizedBox(
          width: size.width * 0.55,
          child: Text("Привет!",
              textAlign: TextAlign.center,
              style: GoogleFonts.robotoMono(
                color: const Color.fromRGBO(55, 48, 74, 1),
                fontSize: size.height * 0.04,
                fontWeight: FontWeight.bold,
              )),
        ),
        SizedBox(
          height: size.width * 0.03,
        ),
        SizedBox(
          width: size.width * 0.55,
          child: Text("Пожалуйста, войдите в свой аккаунт.",
              textAlign: TextAlign.center,
              style: GoogleFonts.robotoMono(
                color: const Color.fromRGBO(128, 124, 142, 1),
                fontSize: size.height * 0.03,
              )),
        ),
        SizedBox(
          height: size.height * 0.05,
        ),
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
                  recoverOnPressed: () => Get.to(
                      () => const PasswordRecoveryPage(),
                      transition: Transition.fadeIn),
                  btnText: Constants.logBtnText,
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                AlreadyHaveAnAccountCheck(
                  onPressed: () => Get.off(() => const SignUpPage(),
                      transition: Transition.fadeIn),
                  fontSize: size.width * 0.03,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
