import 'dart:convert';

import 'package:be_repo/be_repo.dart';
import 'package:get/get.dart';
import 'package:wb_assistant/constants.dart';
import 'package:wb_assistant/controllers/local_storage_controller.dart';

import 'package:wb_assistant/models/token.dart';

import '../views/confirm/confirm_email.dart';
import '../views/home/home.dart';

class AuthenticationController extends GetxController {
  String username = "";
  String email = "";
  String password = "";

  String validateEmail() {
    if (email.contains(" ")) {
      return Constants.spaceInEmailValidationErr;
    } else if (!GetUtils.isEmail(email)) {
      return Constants.emailValidationErr;
    }
    return "";
  }

  String validatePassword() {
    if (password.length <= 4) {
      return Constants.lessThanInPasswordValidationErr;
    } else if (password.contains(" ")) {
      return Constants.spaceInPasswordValidationErr;
    }

    return "";
  }

  String validateName() {
    if (username.length < 4) {
      return Constants.lessThanInNameValidationErr;
    } else if (username.contains(" ")) {
      return Constants.spaceInNameValidationErr;
    }

    return "";
  }

  onSignUpBtnPressed() {
    signUp().then((message) {
      if (message.isEmpty) {
        Get.to(() => const ConfirmEmailPage());
        return;
      }
      Get.snackbar(Constants.err, message);
      return;
    });
  }

  Future<String> signUp() async {
    var s = validateEmail();
    s = s + validateName();
    s = s + validatePassword();
    if (s.isNotEmpty) return s;

    var response = await BeRepository.signUpUser(email, password, username);

    if (response.statusCode == 200) {
      return "";
    } else if (response.statusCode == 500) {
      return Constants.signUpInternalServerError;
    } else if (response.statusCode == 400) {
      return Constants.badRequest;
    }
    return "";
  }

  onSignInBtnPressed() async {
    String mes = await signIn();

    if (mes == "") {
      Get.offAll(() => const Home());
      return;
    }
    Get.snackbar(Constants.err, mes);
    return;
  }

  Future<String> signIn() async {
    var s = validateEmail();
    s = s + validatePassword();
    if (s.isNotEmpty) return s;
    var response = await BeRepository.signInUser(email, password);

    if (response.statusCode == 200) {
      // OK
      TokenMessage tokenMessage =
          TokenMessage.fromJson(jsonDecode(response.body));
      await LocalStorageController.setJWT(tokenMessage.token);
      return "";
    } else if (response.statusCode == 404) {
      // Not Found
      return Constants.signInNotFound;
    } else if (response.statusCode == 400) {
      // Bad request
      return Constants.badRequest;
    }
    return Constants.serverErr;
  }
}
