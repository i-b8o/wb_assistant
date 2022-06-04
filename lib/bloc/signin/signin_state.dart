part of 'signin_bloc.dart';

abstract class SigninState {}

class SigninInitial extends SigninState {}

class SigninSuccessed extends SigninState {
  final User user;

  SigninSuccessed({required this.user});
}

class EmailIsNotConfirmed extends SigninState {
  final String token;
  final String email;
  final String password;

  EmailIsNotConfirmed(
      {required this.token, required this.email, required this.password});
}

class SigninFailedState extends SigninState {
  final String message;

  SigninFailedState({required this.message});
}
