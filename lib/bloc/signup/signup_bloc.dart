import 'package:auth_repo/auth_repo.dart';
import 'package:bloc/bloc.dart';

import '../../constants.dart';
import '../../helpers/validate.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final _authRepo = AuthRepository();
  SignupBloc() : super(SignupInitial()) {
    print("Created SignupBloc");
    on<SignupRequest>((event, emit) async {
      final String email = event.email;
      final String username = event.username;
      final String password = event.password;

      String s = validateEmail(email) +
          validateName(username) +
          validatePassword(password);
      if (s.isNotEmpty) {
        emit(SignupFailedState(message: s));
      } else {
        try {
          int statusCode =
              await _authRepo.signUpUser(email, password, username);

          if (statusCode == 200) {
            emit(SignupSuccessState(email: email, password: password));
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
}
