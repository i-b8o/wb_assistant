part of 'confirmemail_bloc.dart';

abstract class ConfirmEmailEvent {}

class ConfirmEmailResendRequest extends ConfirmEmailEvent {
  final String email;
  final String password;

  ConfirmEmailResendRequest({required this.email, required this.password});
}
