part of 'signup_bloc.dart';

abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupSuccessState extends SignupState {
  final String email;
  final String password;

  SignupSuccessState({required this.email, required this.password});
}

class SignupFailedState extends SignupState {
  final String message;

  SignupFailedState({required this.message});
}
