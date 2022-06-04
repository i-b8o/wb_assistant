import 'package:auth_repo/auth_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:wb_assistant/constants.dart';

part 'confirmemail_event.dart';
part 'confirmemail_state.dart';

class ConfirmemailBloc extends Bloc<ConfirmEmailEvent, ConfirmemailState> {
  final _authRepo = AuthRepository();
  ConfirmemailBloc() : super(ConfirmemailInitial()) {
    on<ConfirmEmailResendRequest>((event, emit) async {
      try {
        int stastusCode = await _authRepo.resend(event.email, event.password);
        if (stastusCode == 200) {
          emit(ConfirmemailSuccess());
        } else {
          emit(ConfirmemailFail(message: Constants.somethingWrong));
        }
      } catch (e) {
        print("ConfirmeEmailBloc Error: $e");
      }
    });
  }
}
