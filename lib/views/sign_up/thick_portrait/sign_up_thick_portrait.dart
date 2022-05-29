import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wb_assistant/views/components/btn_thick_portrait.dart';
import 'package:wb_assistant/views/components/email_text_field_thick_portrait.dart';
import 'package:wb_assistant/views/components/header_thick_portrait.dart';
import 'package:wb_assistant/views/components/password_text_field_thick_portrait.dart';

import '../../../constants.dart';
import '../../../controllers/authentication_controller.dart';
import '../../components/already_have_an_account_check.dart';
import '../../components/welcome_text_fields.dart';
import '../../sign_in/sign_in.dart';
import '../../components/name_text_field_thick_portrait.dart';

class SignUpThickPortrait extends StatelessWidget {
  const SignUpThickPortrait({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('SignUpThickPortrait');
    Size size = MediaQuery.of(context).size;
    bool keyboard = MediaQuery.of(context).viewInsets.bottom > 0.0;

    return ListView(
      padding: EdgeInsets.only(
        left: size.width * 0.07,
        right: size.width * 0.07,
      ),
      children: [
        keyboard
            ? SizedBox(height: size.height * 0.1)
            : const HeaderThickPortrait(
                headerText: Constants.signUpHeaderText,
                greetingText: Constants.signUpGreetingText,
              ),
        TextFieldsWidget(
          fields: [
            const NameTextFieldThickPortrait(),
            SizedBox(height: size.height * 0.01),
            const EmailTextFieldThickPortrait(),
            SizedBox(height: size.height * 0.01),
            const PasswordTextFieldThickPortrait(),
          ],
        ),
        keyboard
            ? SizedBox(
                height: size.height * 0.05,
              )
            : SizedBox(
                height: size.height * 0.1,
              ),
        BtnThickPortrait(
          text: Constants.signUpBtnText,
          press: () =>
              Get.find<AuthenticationController>().onSignUpBtnPressed(),
        ),
        SizedBox(
          height: size.width * 0.1,
        ),
        AlreadyHaveAnAccountCheck(
          onPressed: () =>
              Get.to(() => const SignInPage(), transition: Transition.fadeIn),
          signIn: false,
          fontSize: size.width * 0.03,
        ),
      ],
    );
  }
}
