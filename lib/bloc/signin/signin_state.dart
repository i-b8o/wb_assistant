part of 'signin_bloc.dart';

@immutable
abstract class SigninState {}

class SigninInitial extends SigninState {}

class SigninSuccessed extends SigninState {
  final User user;

  SigninSuccessed({required this.user});
}

class EmailNotConfirmed extends SigninState {}

class ValidationFailed extends SigninState {
  final String message;

  ValidationFailed({required this.message});
}
