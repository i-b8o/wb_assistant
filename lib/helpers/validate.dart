import '../constants.dart';

String validateEmail(String email) {
  if (email.length <= 5) {
    return Constants.lessThanInEmailValidationErr;
  } else if (email.contains(" ")) {
    return Constants.spaceInEmailValidationErr;
  }
  return "";
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
