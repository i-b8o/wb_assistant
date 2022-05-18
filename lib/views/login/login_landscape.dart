import 'package:flutter/material.dart';

import '../../constants.dart';
import '../components/already_have_an_account_check.dart';
import '../components/body_large.dart';
import '../components/rounded_input_field.dart';
import '../components/rounded_password_field.dart';
import '../components/welcome_btns.dart';
import '../components/welcome_header.dart';
import '../components/welcome_text_fields.dart';

// TODO Make Large view for registration
class LoginLandscape extends StatelessWidget {
  const LoginLandscape({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return BodyLarge(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: _width * 0.03,
            ),
            AlreadyHaveAnAccountCheck(
              mobile: false,
              fontSize: _width * 0.01,
            ),
            const WelcomeHeader(
              mobile: false,
              greetingText: Constants.loginGreetingText,
              headerText: Constants.loginHeaderText,
            ),
            TextFieldsWidget(
              fields: [
                RoundedInputField(
                    mobile: false,
                    hintText: Constants.emailInputText,
                    onChanged: (s) {},
                    height: _width * 0.05,
                    width: _width * 0.3),
                RoundedPasswordField(
                  mobile: false,
                  onChanged: (s) {},
                  height: _width * 0.05,
                  width: _width * 0.3,
                )
              ],
            ),
            const WelcomeBtns(
              mobile: false,
              btnText: Constants.logBtnText,
            ),
          ],
        ),
      ),
    );
  }
}
