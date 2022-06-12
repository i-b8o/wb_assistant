part of 'home_bloc.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class WbStaticState extends HomeState {
  String apiKey;
  WbStaticState({
    required this.apiKey,
  });
}

class AlarmState extends HomeState {}

class FaildState extends HomeState {
  final String message;

  FaildState({required this.message});
}

class SettingsState extends HomeState {}
