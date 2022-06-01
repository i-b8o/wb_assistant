part of 'app_bloc.dart';

abstract class AppEvent {
  const AppEvent();
}

class AppStatusChanged extends AppEvent {
  const AppStatusChanged(this.status, this.details);
  final AuthenticationStatus status;
  final Details details;
}

class AppLogoutRequested extends AppEvent {}
