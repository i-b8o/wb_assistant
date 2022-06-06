part of 'home_bloc.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class SupplyState extends HomeState {
  final int statusCode;
  final List<Income> incomes;

  SupplyState(this.statusCode, this.incomes);
}

class AlarmState extends HomeState {}

class FaildState extends HomeState {
  final String message;

  FaildState(this.message);
}

class SettingsState extends HomeState {}
