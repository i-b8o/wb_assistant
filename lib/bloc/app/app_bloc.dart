import 'dart:async';

import 'package:auth_repo/auth_repo.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:storage_repo/storage_repo.dart';
part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final _authRepo = AuthRepository();
  final _storageRepo = StorageRepository();

  AppBloc() : super(AppInitial()) {
    on<AuthRequest>((event, emit) async {
      print("AppLoadInProgressState");
      emit(AppLoadInProgressState());
      try {
        print("try");

        final jwt = await _storageRepo.getJWT();
        print("jwt");
        if (jwt.isEmpty) {
          print("is empty");
          emit(AppTokenNotFound());
        } else {
          print("else");
          UserResponse userMessage = await _authRepo.getUser(jwt);
          if (userMessage.statusCode == 200) {
            emit(AppSignInSuccessState(user: userMessage.user));
          }
        }
      } catch (e) {
        print("Error: $e");
      }
    });
  }

  // @override
  // Stream<AppState> mapEventToState(AppEvent event) async* {
  //   if (event is AuthRequest) {
  //     yield AppLoadInProgress();
  //     try {
  //       final jwt = await _storageRepo.getJWT();
  //     } catch (e){

  //     }
  //   }
  // }
  // AppBloc({required BeRepository beRepository})
  //     : _beRepository = beRepository,
  //       super(const AppState.unknown()) {
  //   // on<AppStatusChanged>(_onAppStatusChanged);
  //   // on<AppLogoutRequested>(_onAppLogoutRequested);
  //   // _responseSubscription = _beRepository.controller.stream.listen((event) {
  //   //   print(event);
  //   // });
  // }

  // late StreamSubscription<Response> _responseSubscription;
  // @override
  // Future<void> close() {
  //   _responseSubscription.cancel();
  //   // _beRepository.dispose();
  //   return super.close();
  // }

  // void _onAppLogoutRequested(
  //     AppLogoutRequested event, Emitter<AppState> emit) {}

  // void _onAppStatusChanged(
  //     AppStatusChanged event, Emitter<AppState> emnit) async {
  //   switch (event.status) {
  //     case AuthenticationStatus.unauthenticated:
  //       return emit(const AppState.unauthenticated());
  //     case AuthenticationStatus.authenticated:
  //       String token = "";
  //       final details = await _tryGetDetails(token);
  //       return emit(details != null
  //           ? AppState.authenticated(details)
  //           : const AppState.unauthenticated());
  //     default:
  //       return emit(const AppState.unknown());
  //   }
  // }

  // Future<Details?> _tryGetDetails(String token) async {
  //   try {
  //     await _beRepository.details(token);
  //   } catch (_) {
  //     return null;
  //   }
  // }
}
