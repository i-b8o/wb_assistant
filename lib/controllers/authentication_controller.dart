import 'dart:convert';

import 'package:be_repo/be_repo.dart';
import 'package:get/get.dart';
import 'package:wb_assistant/controllers/local_storage_controller.dart';
import 'package:wb_assistant/models/credentials.dart';
import 'package:wb_assistant/models/details.dart';
import 'package:wb_assistant/models/server_error.dart';
import 'package:wb_assistant/models/token.dart';

class AuthenticationController extends GetxController {
  String username = "";
  String email = "";
  String password = "";
  var gotDetails = false.obs;
  var serverError = "".obs;
  Details details =
      Details(email: "", expires: "", type: "", username: "", id: '');

  String validateEmail() {
    if (!GetUtils.isEmail(email)) {
      return "Email не валид\n";
    } else if (email.contains(" ")) {
      return "Email не может содержать пробел.\n";
    }
    return "";
  }

  String validatePassword() {
    if (password.length <= 4) {
      return "Пароль должен быть не менее 4 символов\n";
    } else if (password.contains(" ")) {
      return "Пароль не может содержать пробел.\n";
    }

    return "";
  }

  String validateName() {
    if (username.length < 4) {
      return "Имя должно быть не менее 4 символов\n";
    } else if (username.contains(" ")) {
      return "Имя не может содержать пробел.\n";
    }

    return "";
  }

  Future<String> signUpOnPressed() async {
    var s = validateEmail();
    s = s + validateName();
    s = s + validatePassword();
    if (s.isNotEmpty) return s;

    BeRepository.signUpUser(email, password, username).then((response) {
      if (response.statusCode == 200) {
        LocalStorageController.setCredentials(
            Credentials(email: username, password: password));
      }
    });
    return "";
  }

  Future<String> signInOnPressed() async {
    var s = validateEmail();
    s = s + validatePassword();
    if (s.isNotEmpty) return s;

    await BeRepository.signInUser(email, password).then((response) async {
      if (response.statusCode == 200) {
        TokenMessage tokenMes =
            TokenMessage.fromJson(jsonDecode(response.body));

        await LocalStorageController.setJWT(tokenMes.token);
      } else {
        return ServerErr.fromJson(jsonDecode(response.body)).message;
      }
    });
    return "";
  }

  Future<String> getDetails(String token) async {
    BeRepository.details(token).then((response) {
      if (response.statusCode == 200) {
        details = Details.fromJson(jsonDecode(response.body));
      } else {
        serverError.value =
            ServerErr.fromJson(jsonDecode(response.body)).message;
      }
    });
    return "";
  }

  // Future<String> resend() async {
  //   var response = await _beRepository.resend(email, password);
  //   String message =
  //       RegistrationResponseData.fromJson(jsonDecode(response.body)).message;
  //   if (message == "4") {
  //     return "Пользователь с адресом почты $email уже существует";
  //   } else if (message == "2") {
  //     return "2";
  //   } else if (message == "5") {
  //     return "Некорректные данные.";
  //   } else if (message == "6") {
  //     return "Извините, не удалось отправить письмо на адрес $email. Попробуйте позже.";
  //   }
  //   return message;
  // }

  // Future<String> reg() async {
  //   var s = validateEmail();
  //   s = s + validateName();
  //   s = s + validatePassword();
  //   if (s.isNotEmpty) return s;
  //   var response = await _beRepository.signUpUser(name, email, password);
  //   RegistrationResponseData respBody =
  //       RegistrationResponseData.fromJson(jsonDecode(response.body));
  //   String message = respBody.message;
  //   User user = respBody.user;
  //   if (message == "0") {
  //     print(
  //         "Save to local: ${user.username}, ${user.email}, $password, ${user.accounts.first.type}, ${user.accounts.first.expires}");
  //     _localStorageController.setUserData(user.username, user.email, password,
  //         user.accounts.first.type, user.accounts.first.expires);
  //     return message;
  //   }
  //   if (message == "4") {
  //     return "Пользователь с адресом почты $email уже существует";
  //   } else if (message == "2") {
  //     return "2";
  //   } else if (message == "5") {
  //     return "Некорректные данные.";
  //   } else if (message == "6") {
  //     return "Извините, не удалось отправить письмо на адрес $email. Попробуйте позже.";
  //   }
  //   return message;
  // }

  // Future<String> log() async {
  //   // User inputs validation
  //   var s = validateEmail();
  //   s = s + validatePassword();
  //   if (s.isNotEmpty) return s;

  //   // Request
  //   var response = await BeRepository.signInUser(email, password);
  //   if (response.statusCode == 200) {
  //     return "USER";
  //   }
  //   return "depends of the status code";
  //   // SignInResponseData respBody =
  //   //     SignInResponseData.fromJson(jsonDecode(response.body));
  //   // String? message = respBody.message;
  //   // User? user = respBody.user;
  //   // if (message == "1" || message == "3") {
  //   //   return "Неверное имя пользователя или пароль";
  //   // } else if (message == "2") {
  //   //   return "2";
  //   // } else if (message == "3") {
  //   //   return "Адрес электронной почты не подтвержден";
  //   // }
  //   // if (message == null && user != null) {
  //   //   _localStorageController.setUserData(user.username, user.email, password,
  //   //       user.accounts[0].type, user.accounts[0].expires);
  //   // }
  //   // return "";
  // }
}
