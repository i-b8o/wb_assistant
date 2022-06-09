import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:storage_repo/storage_repo.dart';
import 'package:wb_api_repo/wb_api_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  int currentTab = 0;
  int get tab => currentTab;

  set tab(int val) => currentTab = val;

  WBApiRepository wbApiRepository = WBApiRepository();
  StorageRepository storageRepository = StorageRepository();
  HomeBloc() : super(HomeInitial()) {
    on<BottomNavItemPushedEvent>((event, emit) async {
      if (currentTab == 0) {
        emit(HomeInitial());
      } else if (currentTab == 1) {
        try {
          String key = await storageRepository.getApiKey();
          if (key.isEmpty) {
            emit(FaildState(message: "Необходимо сначала добавить ключ API"));
          }
          IncomesResponse incomeResponse = await wbApiRepository.getV1Incomes(
              "2017-03-25T21:00:00.000Z", key);
          int statusCode = incomeResponse.statusCode;
          if (statusCode == 200) {
            List<Supply> supplies = incomeResponse.items;
            if (supplies.isNotEmpty) {
              emit(SupplyState(200, supplies));
            } else {
              emit(FaildState(message: statusCode.toString()));
            }
          } else {
            emit(SupplyState(statusCode, incomeResponse.items));
          }
        } catch (e) {
          log("HomeBloc error: $e");
        }
      } else if (currentTab == 2) {
        emit(AlarmState());
      } else if (currentTab == 3) {
        emit(SettingsState());
      }
    });
  }
}
