import 'package:flutter/material.dart';

import 'package:wb_assistant/views/components/email_text_field_landscape.dart';
import 'package:wb_assistant/views/components/password_text_field_landscape.dart';
import 'package:wb_assistant/views/sign_up/landscape/widgets/name_text_field_landscape.dart';

import '../../../constants.dart';
import '../../components/btn_landscape.dart';
import '../../components/components.dart';
import '../../components/header_landscape.dart';

class SignUpLandscape extends StatelessWidget {
  SignUpLandscape({
    Key? key,
  }) : super(key: key);
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    bool shrinked = MediaQuery.of(context).size.aspectRatio > 12;
    bool keyboard = MediaQuery.of(context).viewInsets.bottom > 0.0;
    print("SignUpLarge");
    Size size = MediaQuery.of(context).size;
    return BodyLarge(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: keyboard ? size.height * 0 : size.height * 0.03,
          ),
          SizedBox(
            width: size.width * 0.5,
            height:
                shrinked || keyboard ? size.height * 0.1 : size.height * 0.2,
            child: Padding(
              padding: EdgeInsets.only(right: size.width * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    Constants.haveAccountText,
                    style: TextStyle(
                        color: const Color.fromRGBO(61, 57, 74, 1),
                        fontWeight: FontWeight.bold,
                        fontSize:
                            keyboard ? size.height * 0 : size.height * 0.02),
                  ),
                  TextButton(
                    onPressed: () => {},
                    child: Text(Constants.signInBtnText,
                        style: TextStyle(
                            color: const Color.fromRGBO(54, 133, 240, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: keyboard
                                ? size.height * 0
                                : size.height * 0.02)),
                  )
                ],
              ),
            ),
          ),
          shrinked || keyboard
              ? Container()
              : const HeaderLandscape(
                  headerText: Constants.signUpHeaderText,
                  greetingText: Constants.signUpGreetingText),
          TextFieldsWidget(
            fields: [
              NameTextFieldLandscape(
                controller: usernameController,
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              EmailTextFieldLandscape(
                controller: emailController,
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              PasswordTextFieldLandscape(
                controller: passwordController,
              ),
            ],
          ),
          shrinked || keyboard
              ? SizedBox(
                  height: size.height * 0.01,
                )
              : SizedBox(
                  height: size.height * 0.05,
                ),
          BtnLandscape(text: Constants.signUpBtnText, press: () => {})
        ],
      ),
    );
  }
}
