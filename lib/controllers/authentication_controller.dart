import 'dart:convert';

import 'package:be_repo/be_repo.dart';
import 'package:get/get.dart';
import 'package:wb_assistant/controllers/local_storage_controller.dart';

import '../models/user.dart';
import '../views/confirm/confirm_email.dart';

class AuthenticationController extends GetxController {
  String name = "";
  String email = "";
  String password = "";
  final LocalStorageController _localStorageController =
      LocalStorageController();

  late BeRepository _beRepository;
  AuthenticationController() {
    _beRepository = BeRepository();
  }

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
    if (name.length < 4) {
      return "Имя должно быть не менее 4 символов\n";
    } else if (name.contains(" ")) {
      return "Имя не может содержать пробел.\n";
    }

    return "";
  }

  void regOnPressed() async {
    String mes = await reg();
    if (mes == "0" || mes == "2") {
      Get.to(() => const ConfirmEmailPage());
      return;
    }
    Get.snackbar("Ошибка", mes);
  }

  Future<String> resend() async {
    var response = await _beRepository.resend(email, password);
    String message =
        RegistrationResponseData.fromJson(jsonDecode(response.body)).message;
    if (message == "4") {
      return "Пользователь с адресом почты $email уже существует";
    } else if (message == "2") {
      return "2";
    } else if (message == "5") {
      return "Некорректные данные.";
    } else if (message == "6") {
      return "Извините, не удалось отправить письмо на адрес $email. Попробуйте позже.";
    }
    return message;
  }

  Future<String> reg() async {
    var s = validateEmail();
    s = s + validateName();
    s = s + validatePassword();
    if (s.isNotEmpty) return s;
    var response = await _beRepository.registerUser(name, email, password);
    RegistrationResponseData respBody =
        RegistrationResponseData.fromJson(jsonDecode(response.body));
    String message = respBody.message;
    User user = respBody.user;
    if (message == "0") {
      print(
          "Save to local: ${user.username}, ${user.email}, $password, ${user.accounts.first.type}, ${user.accounts.first.expires}");
      _localStorageController.setUserData(user.username, user.email, password,
          user.accounts.first.type, user.accounts.first.expires);
      return message;
    }
    if (message == "4") {
      return "Пользователь с адресом почты $email уже существует";
    } else if (message == "2") {
      return "2";
    } else if (message == "5") {
      return "Некорректные данные.";
    } else if (message == "6") {
      return "Извините, не удалось отправить письмо на адрес $email. Попробуйте позже.";
    }
    return message;
  }

  Future<String> log() async {
    // User inputs validation
    var s = validateEmail();
    s = s + validatePassword();
    if (s.isNotEmpty) return s;

    // Request
    var response = await BeRepository.loginUser(email, password);
    if (response.statusCode == 200) {
      return "USER";
    }
    return "depends of the status code";
    // LoginResponseData respBody =
    //     LoginResponseData.fromJson(jsonDecode(response.body));
    // String? message = respBody.message;
    // User? user = respBody.user;
    // if (message == "1" || message == "3") {
    //   return "Неверное имя пользователя или пароль";
    // } else if (message == "2") {
    //   return "2";
    // } else if (message == "3") {
    //   return "Адрес электронной почты не подтвержден";
    // }
    // if (message == null && user != null) {
    //   _localStorageController.setUserData(user.username, user.email, password,
    //       user.accounts[0].type, user.accounts[0].expires);
    // }
    // return "";
  }
}
