import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'password_recovery_components/reset_password_btn.dart';
import 'password_recovery_components/reset_password_description.dart';
import 'password_recovery_components/reset_password_text_field.dart';

class PasswordRecoveryPage extends StatelessWidget {
  const PasswordRecoveryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool keyboard = MediaQuery.of(context).viewInsets.bottom > 0.0;

    print("PasswordRecoveryPage");
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
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
              const ResetPasswordTextField(),
              SizedBox(
                height: size.height * 0.02,
              ),
              const ResetPasswordBtn(),
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
