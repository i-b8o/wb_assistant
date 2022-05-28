import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wb_assistant/controllers/local_storage_controller.dart';

import '../../constants.dart';
import '../../controllers/authentication_controller.dart';
import '../../controllers/rounded_password_field_obscure_controller.dart';

class PasswordTextFieldThickPortrait extends StatelessWidget {
  const PasswordTextFieldThickPortrait({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.85,
      height: size.width * 0.15,
      child: GetX<RoundedPasswordFieldObscureController>(
        init: RoundedPasswordFieldObscureController(),
        initState: (_) {},
        builder: (controller) {
          return TextField(
            obscureText: controller.obscure.isFalse,
            style: TextStyle(fontSize: size.height * 0.02),
            textAlignVertical: TextAlignVertical.center,
            onChanged: (value) {
              Get.find<AuthenticationController>().password = value;
            },
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.white, width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.white, width: 2.0),
                ),
                hintText: Constants.passInputText,
                contentPadding: EdgeInsets.symmetric(
                  vertical: size.height * 0.01,
                  horizontal: size.width * 0.04,
                ),
                suffixIcon: InkWell(
                  onTap: () {
                    controller.toggle();
                  },
                  child: Icon(
                    controller.obscure.isFalse
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: Constants.greyColor,
                    size: size.height * 0.03,
                  ),
                )),
          );
        },
      ),
    );
  }
}
