import 'package:auth_repo/auth_repo.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:storage_repo/storage_repo.dart';
part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final AuthRepository _authRepo = AuthRepository();
  final _storageRepo = StorageRepository();

  AppBloc() : super(AppInitial()) {
    on<AuthRequest>((event, emit) async {
      print("AppLoadInProgressState");
      emit(AppLoadInProgressState());
      try {
        print("try");

        final jwt = await _storageRepo.getJWT();
        print("jwt: $jwt");
        if (jwt.isEmpty) {
          print("JWT is empty");
          emit(AppTokenNotFound());
        } else {
          print("JWT exists");
          UserResponse userresponse = await _authRepo.getUser(jwt);
          if (userresponse.statusCode == 200) {
            print("GetUser successfull type: ${userresponse.user.type}");
            emit(AppSignInSuccessState(user: userresponse.user));
          }
        }
      } catch (e) {
        print("Error in AppBloc: $e");
      }
    });
  }
}
