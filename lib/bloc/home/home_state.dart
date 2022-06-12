part of 'home_bloc.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class SupplyState extends HomeState {
  final int statusCode;
  final List<Supply> supplies;

  SupplyState(this.statusCode, this.supplies);
}

class StockState extends HomeState {
  final int statusCode;
  final List<Supply> supplies;

  StockState(this.statusCode, this.supplies);
}

class AlarmState extends HomeState {}

class FaildState extends HomeState {
  final String message;

  FaildState({required this.message});
}

class SettingsState extends HomeState {}
