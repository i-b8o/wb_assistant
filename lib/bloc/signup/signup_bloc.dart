import 'package:auth_repo/auth_repo.dart';
import 'package:bloc/bloc.dart';

import '../../constants.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final _authRepo = AuthRepository();
  SignupBloc() : super(SignupInitial()) {
    on<SignupRequest>((event, emit) async {
      String s = validateEmail(event.email) +
          validateName(event.username) +
          validatePassword(event.password);
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
          print("Error in SignupBloc: $e");
        }
      }
    });
  }

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
}
