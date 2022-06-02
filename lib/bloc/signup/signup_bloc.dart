import 'package:auth_repo/auth_repo.dart';
import 'package:bloc/bloc.dart';

import '../../constants.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  late String _username;
  late String _email;
  late String _password;

  String get username => _username;
  String get email => _email;
  String get password => _password;

  void changeUserName(String username) {
    _username = username;
  }

  void changeEmail(String email) {
    _email = email;
  }

  void changePassword(String password) {
    _password = password;
  }

  final _authRepo = AuthRepository();
  SignupBloc() : super(SignupInitial()) {
    on<SignupRequest>((event, emit) async {
      String s = validateEmail() + validateName() + validatePassword();
      if (s.isNotEmpty) {
        emit(SignupFailedState(message: s));
      } else {
        try {
          int statusCode = await _authRepo.signUpUser(
              event.email, event.password, event.username);

          if (statusCode == 200) {
            emit(SignupSuccessState());
          } else if (statusCode == 409) {
            emit(SignupFailedState(message: Constants.signUpConflict));
          } else if (statusCode == 500) {
            emit(SignupFailedState(message: Constants.somethingWrong));
          } else if (statusCode == 400) {
            emit(SignupFailedState(message: Constants.badRequest));
          }
        } catch (e) {
          print("Error: $e");
        }
      }
    });
  }

  String validateEmail() {
    if (email.length <= 5) {
      return Constants.lessThanInEmailValidationErr;
    } else if (_email.contains(" ")) {
      return Constants.spaceInEmailValidationErr;
    }
    return "";
  }

  String validatePassword() {
    if (password.length <= 4) {
      return Constants.lessThanInPasswordValidationErr;
    } else if (_password.contains(" ")) {
      return Constants.spaceInPasswordValidationErr;
    }

    return "";
  }

  String validateName() {
    if (username.length < 4) {
      return Constants.lessThanInNameValidationErr;
    } else if (_username.contains(" ")) {
      return Constants.spaceInNameValidationErr;
    }

    return "";
  }
}
