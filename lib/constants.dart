import 'package:flutter/material.dart';

class Constants {
  static const bgColor = Color.fromRGBO(224, 222, 229, 1);
  static const pinkColor = Color.fromRGBO(222, 157, 255, 1);
  static const greyColor = Color.fromRGBO(198, 194, 205, 1);
  static const azureColor = Color.fromRGBO(24, 59, 102, 1);
  static const String signUpHeaderText = "Добро пожаловать!";
  static const String signUpGreetingText =
      "Давайте зарегистрируем вам аккаунт.";
  static const String signInHeaderText = "Привет!";
  static const String signInGreetingText =
      "Пожалуйста, войдите в свой аккаунт.";
  static const String emailInputText = "Введите email";
  static const String nameInputText = "Введите имя";
  static const String regBtnText = "Зарегистрировать";
  static const String logBtnText = "Войти";
  static const String confirmHeaderText = "Проверьте свой email!";
  static const String confirmGreetingText =
      "На ваш адрес отправлено письмо подтверждения регистрации, удостоверьтесь не попало ли оно в папку «Спам»";
  static const String confirmBtnText = "Отправить повторно!";

  static const String emailValidationErr = "Неверный адрес электронной почты\n";
  static const String spaceInEmailValidationErr =
      "Адрес электронной почты не может содержать пробел.\n";
  static const String lessThanInPasswordValidationErr =
      "Пароль должен быть не менее 4 символов\n";
  static const String spaceInPasswordValidationErr =
      "Пароль не может содержать пробел.\n";
  static const String lessThanInNameValidationErr =
      "Имя должно быть не менее 4 символов\n";
  static const String spaceInNameValidationErr =
      "Имя не может содержать пробел.\n";

  static const String signUpInternalServerError =
      "Пользователь с такими адресом электронной почты уже зарегистрирован!";
}
