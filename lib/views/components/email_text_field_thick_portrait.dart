import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../controllers/authentication_controller.dart';

class EmailTextFieldThickPortrait extends StatelessWidget {
  const EmailTextFieldThickPortrait({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.85,
      height: size.height * 0.08,
      child: TextField(
        style: TextStyle(fontSize: size.height * 0.02),
        textAlignVertical: TextAlignVertical.center,
        onChanged: (value) {
          Get.find<AuthenticationController>().email = value;
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
          hintText: Constants.emailInputText,
          contentPadding: EdgeInsets.symmetric(
            vertical: size.height * 0.03,
            horizontal: size.width * 0.04,
          ),
        ),
      ),
    );
  }
}