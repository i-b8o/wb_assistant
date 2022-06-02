part of 'signup_bloc.dart';

abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupSuccessState extends SignupState {}

class SignupFailedState extends SignupState {
  final String message;

  SignupFailedState({required this.message});
}
