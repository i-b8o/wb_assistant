part of 'app_bloc.dart';

class AppState {
  const AppState._(
      {this.status = AuthenticationStatus.unknown,
      this.token = "",
      this.details = Details.empty});
  final AuthenticationStatus status;
  final String token;
  final Details details;

  const AppState.unknown() : this._();
  const AppState.authenticated(Details details)
      : this._(status: AuthenticationStatus.authenticated, details: details);

  const AppState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);
}
