part of 'signin_bloc.dart';

@immutable
abstract class SigninEvent {}

class SigninRequest extends SigninEvent {
  final String email;
  final String password;

  SigninRequest({required this.email, required this.password});
}
