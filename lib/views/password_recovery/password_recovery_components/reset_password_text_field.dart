import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../controllers/authentication_controller.dart';

class ResetPasswordTextField extends StatelessWidget {
  const ResetPasswordTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.85,
      height: size.height * 0.07,
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        onChanged: (value) {
          Get.find<AuthenticationController>().email = value;
        },
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
                color: Constants.recoverPasswordBtnColor, width: 2.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: 'Email',
          contentPadding: EdgeInsets.all(
            size.height * 0.01,
          ),
        ),
      ),
    );
  }
}
