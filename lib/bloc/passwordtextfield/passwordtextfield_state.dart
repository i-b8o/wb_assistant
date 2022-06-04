part of 'passwordtextfield_bloc.dart';

abstract class PasswordtextfieldState {}

class PasswordtextfieldInitial extends PasswordtextfieldState {}

class PasswordtextfieldPushed extends PasswordtextfieldState {
  final bool obscure;

  PasswordtextfieldPushed({required this.obscure});
}
