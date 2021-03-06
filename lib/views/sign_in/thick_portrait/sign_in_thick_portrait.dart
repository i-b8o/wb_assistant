import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:wb_assistant/views/components/email_text_field_thick_portrait.dart';
import 'package:wb_assistant/views/components/header_thick_portrait.dart';
import '../../../constants.dart';

import '../../components/already_have_an_account_check.dart';
import '../../components/btn_thick_portrait.dart';
import '../../components/password_text_field_thick_portrait.dart';
import '../../components/welcome_text_fields.dart';
import '../../sign_up/sign_up_page.dart';

class SignInThickPortrait extends StatelessWidget {
  const SignInThickPortrait({
    Key? key,
    required this.emailController,
    required this.passwordController,
    required this.onPress,
    required this.alreadyHaveAccountCheckOnPressed,
  }) : super(key: key);
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final void Function(BuildContext context, TextEditingController email,
      TextEditingController pass) onPress;
  final void Function(BuildContext context) alreadyHaveAccountCheckOnPressed;
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
                EmailTextFieldThickPortrait(
                  controller: emailController,
                ),
                SizedBox(height: size.height * 0.01),
                PasswordTextFieldThickPortrait(
                  controller: passwordController,
                ),
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
                              onPressed: () => {},
                              child: Text(
                                "???????????????????????????? ????????????",
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
                    press: () => {
                          onPress(context, emailController, passwordController)
                        }),
                SizedBox(
                  height: size.height * 0.04,
                ),
                AlreadyHaveAnAccountCheck(
                  onPressed: () {
                    alreadyHaveAccountCheckOnPressed(context);
                  },
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
