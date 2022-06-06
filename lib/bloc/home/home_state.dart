part of 'home_bloc.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class SupplyState extends HomeState {}

class AlarmState extends HomeState {}

class SettingsState extends HomeState {
  final int statusCode;
  final List<Income>? incomes;

  SettingsState(this.statusCode, this.incomes);
}
