import 'package:flutter/material.dart';

class Constants {
  static const wbColor = Color.fromRGBO(58, 0, 120, 1);
  static const greenColor = Color.fromRGBO(0, 182, 92, 1);
  static const bgColor = Color.fromRGBO(224, 222, 229, 1);

  static const headerColor = Color.fromRGBO(55, 48, 74, 1);

  static const pinkColor = Color.fromRGBO(222, 157, 255, 1);
  static const greyColor = Color.fromRGBO(198, 194, 205, 1);
  static const lightGreyColor = Color.fromRGBO(243, 249, 255, 1);

  static const blueColor = Color.fromRGBO(34, 108, 243, 1);
  static const azureColor = Color.fromRGBO(24, 59, 102, 1);
  static const btnColor = Color.fromRGBO(248, 107, 102, 1);

  static const String resetPasswordHeader = "Сбросить пароль";
  static const String resetPasswordText =
      "Введите адрес электронной почты к которому привязан ваш аккаунт и мы отправим письмо с паролем";
  static const String resetPasswordBtnText = "Отправить!";
  static const String signUpHeaderText = "Добро пожаловать!";
  static const String signUpGreetingText =
      "Давайте зарегистрируем вам аккаунт.";
  static const String signInHeaderText = "Привет!";
  static const String signInGreetingText =
      "Пожалуйста, войдите в свой аккаунт.";

  static const String toReg = "Зарегистрироваться";
  static const String passRecText = "Восстановление пароля";
  static const String noAccountYetText = "Ещё нет аккаунта?";
  static const String haveAccountText = "Уже есть аккаунт?";
  static const String emailInputText = "Email";
  static const String nameInputText = "Имя";
  static const String passInputText = "Пароль";
  static const String signUpBtnText = "Зарегистрировать";
  static const String signInBtnText = "Войти";
  static const String passRecoverBtnText = "Отправить";
  static const String confirmHeaderText = "Проверьте свой email!";
  static const String confirmGreetingText =
      "На ваш адрес отправлено письмо подтверждения регистрации, удостоверьтесь не попало ли оно в папку «Спам»";
  static const String confirmBtnText = "Отправить повторно!";

  static const String lessThanInEmailValidationErr =
      "Email должен быть не менее 6 символов (x@y.zz)\n";
  static const String emailValidationErr = "Неверный адрес электронной почты\n";
  static const String emailValidationErrWhereDog =
      "Адрес электронной почты должен содержать @\n";
  static const String emailValidationErrWherePoint =
      "Адрес электронной почты должен содержать '.'\n";
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

  static const String signUpConflict =
      "Пользователь с такими адресом электронной почты уже зарегистрирован!";

  static const String signInNotFound =
      "Неправильный адрес электронной почты или пароль!";
  static const String badRequest = "Введены некорректные данные!";

  static const String serverErr = "Введены некорректные данные!";
  static const String err = "Ошибка";
  static const String somethingWrong = "Что-то пошло не так";
  static const String searchHint = "Найти...";
}
