import 'package:bloc/bloc.dart';
part 'passwordtextfield_event.dart';
part 'passwordtextfield_state.dart';

class PasswordtextfieldBloc
    extends Bloc<PasswordtextfieldEvent, PasswordtextfieldState> {
  bool obscure = true;
  PasswordtextfieldBloc() : super(PasswordtextfieldInitial()) {
    print("Created PasswordtextfieldBloc");
    on<Pushed>((event, emit) {
      obscure = !obscure;
      emit(PasswordtextfieldPushed(obscure: obscure));
    });
  }
}
