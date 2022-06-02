part of 'signup_bloc.dart';

abstract class SignupEvent {}

class SignupRequest extends SignupEvent {
  final String username;
  final String email;
  final String password;

  SignupRequest(
      {required this.username, required this.email, required this.password});
}
