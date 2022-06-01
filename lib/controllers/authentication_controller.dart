import 'dart:convert';

import 'package:auth_repo/auth_repo.dart';
import 'package:get/get.dart';

import 'package:wb_assistant/constants.dart';
import 'package:wb_assistant/controllers/local_storage_controller.dart';

import 'package:wb_assistant/views/sign_in/sign_in.dart';

import '../models/details.dart';
import '../views/confirm/confirm_email.dart';
import '../views/home/home.dart';

class AuthenticationController extends GetxController {
  String username = "";
  String email = "";
  String password = "";
  LocalStorageController localStorageController;
  AuthenticationController({
    required this.localStorageController,
  });
  String validateEmail() {
    if (email.length <= 5) {
      return Constants.lessThanInEmailValidationErr;
    } else if (email.contains(" ")) {
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
    print("Pressed$username-$email-$password");
    signUp().then((message) {
      print(message);
      if (message.isEmpty) {
        print("message empty");
        Get.to(() => const ConfirmEmailPage());
        return;
      }
      print("After");
      Get.snackbar(Constants.err, message);
      return;
    });
  }

  Future<String> signUp() async {
    var s = validateEmail();
    s = s + validateName();
    s = s + validatePassword();
    if (s.isNotEmpty) return s;

    // var response = await BeRepository.signUpUser(email, password, username);

    // if (response.statusCode == 200) {
    //   return "";
    // } else if (response.statusCode == 409) {
    //   return Constants.signUpConflict;
    // } else if (response.statusCode == 500) {
    //   return Constants.somethingWrong;
    // } else if (response.statusCode == 400) {
    //   return Constants.badRequest;
    // }
    return "";
  }

  onSignInBtnPressed() async {
    String mes = await signIn();

    if (mes == "") {
      print("MAST GO TO HOME()");
      // Get.to(() => Home());
      return;
    }
    Get.snackbar(Constants.err, mes);
    return;
  }

  Future<String> signIn() async {
    var s = validateEmail();
    s = s + validatePassword();
    if (s.isNotEmpty) return s;
    // var response = await BeRepository.signInUser(email, password);

    // if (response.statusCode == 200) {
    //   // OK
    //   TokenMessage tokenMessage =
    //       TokenMessage.fromJson(jsonDecode(response.body));
    //   await LocalStorageController.setJWT(tokenMessage.token);
    //   // Need to save passoword for next requests because API never send in a response Password values
    //   await LocalStorageController.saveValue("password", password);
    //   localStorageController.fetchDetails();
    //   return "";
    // } else if (response.statusCode == 404) {
    //   // Not Found
    //   return Constants.signInNotFound;
    // } else if (response.statusCode == 400) {
    //   // Bad request
    //   return Constants.badRequest;
    // }
    return Constants.serverErr;
  }

  onResendBtnPressed() async {
    String mes = await resend();

    if (mes == "") {
      Get.to(() => const SignInPage());
      return;
    }
    Get.snackbar(Constants.err, mes);
    return;
  }

  Future<String> resend() async {
    // Details details = await LocalStorageController.loadDetails();
    // String jwt = await LocalStorageController.getJWTFromLocalStorage();

    // if (jwt == "" || details.email == "" || details.password == "") {
    //   return Constants.somethingWrong;
    // }

    // var response =
    //     await BeRepository.resend(jwt, details.email, details.password);
    // if (response.statusCode == 200) {
    //   // OK
    //   return "";
    // }

    return Constants.somethingWrong;
  }

  onRecoverBtnPressed() async {
    String mes = await recover();

    if (mes == "") {
      Get.to(() => const SignInPage());
      return;
    }
    Get.snackbar(Constants.err, mes);
    return;
  }

  Future<String> recover() async {
    var s = validateEmail();

    // if (s.isNotEmpty) return s;
    // var response = await BeRepository.recover(email);

    // if (response.statusCode == 200) {
    //   // OK
    //   return "";
    // } else if (response.statusCode == 404) {
    //   // Not Found
    //   return Constants.signInNotFound;
    // } else if (response.statusCode == 400) {
    //   // Bad request
    //   return Constants.badRequest;
    // }
    return Constants.serverErr;
  }
}
