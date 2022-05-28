import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../controllers/authentication_controller.dart';
import '../../components/rounded_button.dart';
import '../../components/rounded_input_field.dart';
import '../../components/rounded_password_field.dart';
import '../../components/welcome_text_fields.dart';

class SignUpThickPortraitFieldsAndBtn extends StatelessWidget {
  const SignUpThickPortraitFieldsAndBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        TextFieldsWidget(
          fields: [
            RoundedInputField(
                email: false,
                hintText: Constants.nameInputText,
                onChanged: (username) =>
                    Get.find<AuthenticationController>().username = username,
                height: size.height * 0.1,
                width: size.width * 0.6),
            RoundedInputField(
                hintText: Constants.emailInputText,
                onChanged: (email) =>
                    Get.find<AuthenticationController>().email = email,
                height: size.height * 0.1,
                width: size.width * 0.6),
            RoundedPasswordField(
              onChanged: (password) =>
                  Get.find<AuthenticationController>().password = password,
              height: size.height * 0.1,
              width: size.width * 0.6,
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RoundedButton(
              height: size.height * 0.1,
              width: size.width * 0.6,
              text: Constants.regBtnText,
              press: () {
                print("BBBBBBBBBBBBBBBB");
                Get.find<AuthenticationController>().onSignUpBtnPressed();
              },
            ),
          ],
        ),
      ],
    );
  }
}
