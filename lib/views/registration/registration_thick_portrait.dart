import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';

import '../components/already_have_an_account_check.dart';

import '../login/login.dart';
import 'registration_components/registration_components.dart';

class RegistrationThickPortrait extends StatelessWidget {
  const RegistrationThickPortrait({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Constants.bgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const RegistrationThickPortraitHeader(),
          const RegistrationThickPortraitFieldsAndBtn(),
          SizedBox(
            height: _size.width * 0.1,
          ),
          AlreadyHaveAnAccountCheck(
            onPressed: () =>
                Get.to(() => const LoginPage(), transition: Transition.fadeIn),
            login: false,
            fontSize: _size.width * 0.03,
          ),
        ],
      ),
    );
  }
}
