import 'dart:async';

import 'package:be_repo/be_repo.dart';

import 'package:bloc/bloc.dart';
part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({required BeRepository beRepository})
      : _beRepository = beRepository,
        super(const AppState.unknown()) {
    on<AppStatusChanged>(_onAppStatusChanged);
    on<AppLogoutRequested>(_onAppLogoutRequested);
    _responseSubscription = _beRepository.controller.stream.listen((event) {
      print(event);
    });
  }

  final BeRepository _beRepository;
  late StreamSubscription<Response> _responseSubscription;
  @override
  Future<void> close() {
    _responseSubscription.cancel();
    // _beRepository.dispose();
    return super.close();
  }

  void _onAppLogoutRequested(
      AppLogoutRequested event, Emitter<AppState> emit) {}

  void _onAppStatusChanged(
      AppStatusChanged event, Emitter<AppState> emnit) async {
    switch (event.status) {
      case AuthenticationStatus.unauthenticated:
        return emit(const AppState.unauthenticated());
      case AuthenticationStatus.authenticated:
        String token = "";
        final details = await _tryGetDetails(token);
        return emit(details != null
            ? AppState.authenticated(details)
            : const AppState.unauthenticated());
      default:
        return emit(const AppState.unknown());
    }
  }

  Future<Details?> _tryGetDetails(String token) async {
    try {
      await _beRepository.details(token);
    } catch (_) {
      return null;
    }
  }
}
