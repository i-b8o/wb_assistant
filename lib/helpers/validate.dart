import '../constants.dart';

String validateEmail(String email) {
  RegExp emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  if (email.length <= 5) {
    return Constants.lessThanInEmailValidationErr;
  } else if (email.contains(" ")) {
    return Constants.spaceInEmailValidationErr;
  } else if (!email.contains("@")) {
    return Constants.emailValidationErrWhereDog;
  } else if (!email.contains(".")) {
    return Constants.emailValidationErrWherePoint;
  } else if (emailValid.hasMatch(email)) {
    return "";
  }
  return Constants.emailValidationErr;
}

String validatePassword(String password) {
  if (password.length <= 4) {
    return Constants.lessThanInPasswordValidationErr;
  } else if (password.contains(" ")) {
    return Constants.spaceInPasswordValidationErr;
  }

  return "";
}

String validateName(String username) {
  if (username.length < 4) {
    return Constants.lessThanInNameValidationErr;
  } else if (username.contains(" ")) {
    return Constants.spaceInNameValidationErr;
  }

  return "";
}
