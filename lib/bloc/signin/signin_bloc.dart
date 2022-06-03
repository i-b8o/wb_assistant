import 'package:auth_repo/auth_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../constants.dart';
import '../../helpers/validate.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  final _authRepo = AuthRepository();
  SigninBloc() : super(SigninInitial()) {
    on<SigninRequest>((event, emit) async {
      print("AAAAAAAAAAAA0 ${event.email} ${event.password}");
      String s = validateEmail(event.email) + validatePassword(event.password);
      if (s.isNotEmpty) {
        emit(SigninFailedState(message: s));
      } else {
        try {
          print("AAAAAAAAAAAA1");
          TokenResponse response =
              await _authRepo.signInUser(event.email, event.password);
          print("AAAAAAAAAAAA2");
          if (response.statusCode == 200 && response.token.isNotEmpty) {
            print("AAAAAAAAAAAA3");
            UserResponse userResponse = await _authRepo.getUser(response.token);
            if (userResponse.statusCode == 200) {
              print("AAAAAAAAAAAA4");
              emit(SigninSuccessed(user: userResponse.user));
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
          print("Error in SignupBloc: $e");
        }
      }
    });
  }
}
