import 'package:auth_repo/auth_repo.dart';
import 'package:bloc/bloc.dart';

import '../../constants.dart';
import '../../helpers/validate.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  final _authRepo = AuthRepository();
  SigninBloc() : super(SigninInitial()) {
    on<SigninRequest>((event, emit) async {
      String email = event.email;
      String password = event.password;
      String s = validateEmail(email) + validatePassword(password);
      if (s.isNotEmpty) {
        emit(SigninFailedState(message: s));
      } else {
        try {
          TokenResponse response = await _authRepo.signInUser(email, password);
          String token = response.token;
          if (response.statusCode == 200 && token.isNotEmpty) {
            UserResponse userResponse = await _authRepo.getUser(token);
            if (userResponse.statusCode == 200) {
              if (userResponse.user.type == "none") {
                emit(EmailIsNotConfirmed(
                    token: token, email: email, password: password));
              } else {
                emit(SigninSuccessed(user: userResponse.user));
              }
            } else if (response.statusCode == 400) {
              emit(SigninFailedState(message: Constants.badRequest));
            } else {
              emit(SigninFailedState(message: Constants.somethingWrong));
            }
          } else if (response.statusCode == 404) {
            emit(SigninFailedState(message: Constants.signInNotFound));
          } else if (response.statusCode == 500) {
            emit(SigninFailedState(message: Constants.somethingWrong));
          } else if (response.statusCode == 400) {
            emit(SigninFailedState(message: Constants.badRequest));
          }
        } catch (e) {
          print("SigninBloc Error: $e");
        }
      }
    });
  }
}
