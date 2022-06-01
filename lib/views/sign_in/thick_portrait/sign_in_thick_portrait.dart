import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:wb_assistant/views/components/email_text_field_thick_portrait.dart';
import 'package:wb_assistant/views/components/header_thick_portrait.dart';
import '../../../constants.dart';
import '../../../controllers/authentication_controller.dart';
import '../../components/already_have_an_account_check.dart';
import '../../components/btn_thick_portrait.dart';
import '../../components/password_text_field_thick_portrait.dart';
import '../../components/welcome_text_fields.dart';
import '../../password_recovery/password_recovery.dart';
import '../../sign_up/sign_up_page.dart';

class SignInThickPortrait extends StatelessWidget {
  const SignInThickPortrait({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("SignInThickPortrait");
    Size size = MediaQuery.of(context).size;
    bool keyboard = MediaQuery.of(context).viewInsets.bottom > 0.0;

    return Column(
      children: [
        keyboard
            ? SizedBox(height: size.height * 0.1)
            : const HeaderThickPortrait(
                headerText: Constants.signInHeaderText,
                greetingText: Constants.signInGreetingText),
        SizedBox(
          height: size.height * 0.05,
        ),
        Column(
          children: [
            TextFieldsWidget(
              fields: [
                const EmailTextFieldThickPortrait(),
                SizedBox(height: size.height * 0.01),
                const PasswordTextFieldThickPortrait(),
                SizedBox(
                  height: size.height * 0.05,
                ),
                keyboard
                    ? Container()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: size.width * 0.07),
                            child: TextButton(
                              onPressed: () => Get.to(
                                  () => const PasswordRecoveryPage(),
                                  transition: Transition.fadeIn),
                              child: Text(
                                "Восстановление пароля",
                                textAlign: TextAlign.end,
                                style: GoogleFonts.robotoMono(
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.width * 0.03,
                                  color: const Color.fromRGBO(128, 124, 142, 1),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                BtnThickPortrait(
                    text: Constants.signInBtnText,
                    press: () => Get.find<AuthenticationController>()
                        .onSignInBtnPressed()),
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
      ],
    );
  }
}
