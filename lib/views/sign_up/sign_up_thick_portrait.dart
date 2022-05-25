import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wb_assistant/controllers/authentication_controller.dart';

import '../../constants.dart';

import '../components/already_have_an_account_check.dart';

import '../sign_in/sign_in.dart';
import 'sign_up_components/sign_up_components.dart';

class SignUpThickPortrait extends StatelessWidget {
  const SignUpThickPortrait({Key? key, required this.controller})
      : super(key: key);
  final AuthenticationController controller;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Constants.bgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SignUpThickPortraitHeader(),
          const SignUpThickPortraitFieldsAndBtn(),
          SizedBox(
            height: size.width * 0.1,
          ),
          AlreadyHaveAnAccountCheck(
            onPressed: () =>
                Get.to(() => const SignInPage(), transition: Transition.fadeIn),
            signIn: false,
            fontSize: size.width * 0.03,
          ),
        ],
      ),
    );
  }
}
