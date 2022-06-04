part of 'confirmemail_bloc.dart';

abstract class ConfirmemailState {}

class ConfirmemailInitial extends ConfirmemailState {}

class ConfirmemailSuccess extends ConfirmemailState {}

class ConfirmemailFail extends ConfirmemailState {
  final String message;

  ConfirmemailFail({required this.message});
}
