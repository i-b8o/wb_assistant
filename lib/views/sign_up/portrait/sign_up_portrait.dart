import 'package:flutter/material.dart';

import 'package:wb_assistant/views/components/btn_thick_portrait.dart';
import 'package:wb_assistant/views/components/email_text_field_thick_portrait.dart';
import 'package:wb_assistant/views/components/header_thick_portrait.dart';
import 'package:wb_assistant/views/components/name_text_field_thick_portrait.dart';
import 'package:wb_assistant/views/components/password_text_field_thick_portrait.dart';
import '../../../constants.dart';
import '../../../controllers/authentication_controller.dart';
import '../../components/components.dart';
import '../../sign_in/sign_in.dart';

// TODO use MediaQueryData widget
class SignUpPortrait extends StatelessWidget {
  const SignUpPortrait({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('SignUpPortrait');
    Size size = MediaQuery.of(context).size;
    bool keyboard = MediaQuery.of(context).viewInsets.bottom > 0.0;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Constants.bgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          keyboard
              ? SizedBox(height: size.height * 0.1)
              : const HeaderThickPortrait(
                  headerText: Constants.signUpHeaderText,
                  greetingText: Constants.signUpGreetingText),
          Column(
            children: [
              TextFieldsWidget(
                fields: [
                  const NameTextFieldThickPortrait(),
                  SizedBox(height: size.height * 0.01),
                  const EmailTextFieldThickPortrait(),
                  SizedBox(height: size.height * 0.01),
                  const PasswordTextFieldThickPortrait()
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
                press: () => {},
              )
            ],
          ),
          SizedBox(
            height: size.width * 0.2,
          ),
          AlreadyHaveAnAccountCheck(
            onPressed: () => {},
            signIn: false,
            fontSize: size.width * 0.04,
          ),
        ],
      ),
    );
  }
}
