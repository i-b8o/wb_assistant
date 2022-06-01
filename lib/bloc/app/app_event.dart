part of 'app_bloc.dart';

abstract class AppEvent {
  const AppEvent();
}

class AuthRequest extends AppEvent {}

class AppLogoutRequested extends AppEvent {}
