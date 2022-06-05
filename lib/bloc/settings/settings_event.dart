part of 'settings_bloc.dart';

abstract class SettingsEvent {}

class ApiKeyPressed extends SettingsEvent {}

class ApiKeyPasted extends SettingsEvent {
  final String key;

  ApiKeyPasted(this.key);
}

class ApiNewKeyPasted extends SettingsEvent {
  final String key;

  ApiNewKeyPasted(this.key);
}

class Back extends SettingsEvent {}
