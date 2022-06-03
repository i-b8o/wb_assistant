import 'package:auth_repo/auth_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../helpers/validate.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  SigninBloc() : super(SigninInitial()) {
    on<SigninRequest>((event, emit) {
      String s = validateEmail(event.email) + validatePassword(event.password);
      if (s.isNotEmpty) {
        emit(ValidationFailed(message: s));
      } else {}
    });
  }
}
