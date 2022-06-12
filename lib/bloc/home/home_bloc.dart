import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:storage_repo/storage_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  int currentTab = 0;
  int get tab => currentTab;

  set tab(int val) => currentTab = val;

  StorageRepository storageRepository = StorageRepository();
  HomeBloc() : super(HomeInitial()) {
    on<BottomNavItemPushedEvent>(_onBottomNavItemPushedEvent);
  }

  Future<void> _onBottomNavItemPushedEvent(
      HomeEvent event, Emitter<HomeState> emit) async {
    if (currentTab == 0) {
      emit(HomeInitial());
    } else if (currentTab == 1) {
      try {
        String key = await storageRepository.getApiKey();
        if (key.isEmpty) {
          emit(FaildState(message: "Вам необходимо сначала добавить ключ API"));
          emit(SettingsState());
          return;
        } else {
          emit(WbStaticState(apiKey: key));
          return;
        }
      } catch (e) {
        log("HomeBloc error: $e");
      }
    } else if (currentTab == 2) {
      emit(AlarmState());
    } else if (currentTab == 3) {
      emit(SettingsState());
    }
  }
}
