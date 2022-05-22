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
    Size _size = MediaQuery.of(context).size;
    return GetBuilder<AuthenticationController>(
      init: AuthenticationController(),
      initState: (_) {},
      builder: (controller) {
        return Column(
          children: [
            TextFieldsWidget(
              fields: [
                RoundedInputField(
                    email: false,
                    hintText: Constants.nameInputText,
                    onChanged: (username) => controller.name = username,
                    height: _size.height * 0.1,
                    width: _size.width * 0.6),
                RoundedInputField(
                    hintText: Constants.emailInputText,
                    onChanged: (email) => controller.email = email,
                    height: _size.height * 0.1,
                    width: _size.width * 0.6),
                RoundedPasswordField(
                  onChanged: (password) => controller.password = password,
                  height: _size.height * 0.1,
                  width: _size.width * 0.6,
                )
              ],
            ),
            // TODO Create the ConfirmMail Page and perform transition to the confirm mail page with autmatic transition to SignIn
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RoundedButton(
                  height: _size.height * 0.1,
                  width: _size.width * 0.6,
                  text: Constants.regBtnText,
                  press: () async {
                    String mes = "";

                    mes = await controller.reg();
                    // TODO style snackbar and perform different snakcbars for error and success
                    if (mes != "") Get.snackbar("BBBBBB", mes);
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
