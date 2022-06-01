part of 'app_bloc.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class AppLoadInProgressState extends AppState {}

class AppSignInSuccessState extends AppState {
  final User user;
  AppSignInSuccessState({required this.user});
}

class AppTokenNotFound extends AppState {}
