import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:wb_assistant/constants.dart';
import 'package:wb_assistant/views/components/btn_thick_portrait.dart';
import 'package:wb_assistant/views/components/email_text_field_thick_portrait.dart';

import '../../controllers/authentication_controller.dart';

import 'password_recovery_components/reset_password_description.dart';

class PasswordRecoveryPage extends StatelessWidget {
  const PasswordRecoveryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool keyboard = MediaQuery.of(context).viewInsets.bottom > 0.0;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: GestureDetector(
          onTap: () => Get.back(),
          child: Row(children: [
            Icon(
              Icons.keyboard_backspace,
              color: Colors.black,
              size: size.width * 0.05,
            ),
            const SizedBox(
              width: 3,
            ),
            Text(
              "Назад",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: size.width * 0.03,
                  fontWeight: FontWeight.bold),
            )
          ]),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: keyboard ? 0 : size.height * 0.12,
          ),
          const ResetPasswordDescription(),
          Column(
            children: [
              const EmailTextFieldThickPortrait(),
              SizedBox(
                height: size.height * 0.02,
              ),
              GetBuilder<AuthenticationController>(
                initState: (_) {},
                builder: (controller) {
                  return BtnThickPortrait(
                    press: () => controller.onRecoverBtnPressed(),
                    text: Constants.passRecoverBtnText,
                  );
                },
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
        ],
      ),
    );
  }
}
