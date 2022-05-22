import 'package:flutter/material.dart';

import '../../constants.dart';
import '../components/components.dart';

class SignUpLarge extends StatelessWidget {
  const SignUpLarge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return BodyLarge(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: _width * 0.03,
          ),
          AlreadyHaveAnAccountCheck(
            signIn: false,
            mobile: false,
            fontSize: _width * 0.01,
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
                  onChanged: (s) {},
                  height: _width * 0.05,
                  width: _width * 0.3),
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
            signIn: false,
            btnText: Constants.regBtnText,
          ),
        ],
      ),
    );
  }
}
