part of 'signin_bloc.dart';

@immutable
abstract class SigninState {}

class SigninInitial extends SigninState {}

class SigninSuccessed extends SigninState {
  final User user;

  SigninSuccessed({required this.user});
}

class SigninFailedState extends SigninState {
  final String message;

  SigninFailedState({required this.message});
}
