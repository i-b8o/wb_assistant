import 'package:auth_repo/auth_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'confirmemail_event.dart';
part 'confirmemail_state.dart';

class ConfirmemailBloc extends Bloc<ConfirmEmailEvent, ConfirmemailState> {
  final _authRepo = AuthRepository();
  ConfirmemailBloc() : super(ConfirmemailInitial()) {
    on<ConfirmEmailResendRequest>((event, emit) {
      try {} catch (e) {}
    });
  }
}
