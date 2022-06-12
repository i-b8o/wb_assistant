import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:storage_repo/storage_repo.dart';
import 'package:wb_api_repo/wb_api_repo.dart';
import 'package:wb_assistant/helpers/custom_icons.dart';
import 'package:wb_assistant/models/wb_static_list_view_btn.dart';

part 'wbstatic_event.dart';
part 'wbstatic_state.dart';

class WbstaticBloc extends Bloc<WbstaticEvent, WbstaticState> {
  int currentTab = 0;
  int get tab => currentTab;
  set tab(int val) => currentTab = val;

  final List<WbStaticBtn> apiList = const [
    WbStaticBtn(name: 'Поставки', icon: Custom.warehouse),
    WbStaticBtn(name: 'Склад', icon: Custom.alarm),
    WbStaticBtn(name: 'Заказы', icon: Custom.lock),
    WbStaticBtn(name: 'Продажи', icon: Custom.notifications),
    WbStaticBtn(name: 'КиЗы', icon: Custom.person),
  ];

  WBApiRepository wbApiRepository = WBApiRepository();

  StorageRepository storageRepository = StorageRepository();

  WbstaticBloc() : super(WbstaticInitial()) {
    on<ListViewItemPushedEvent>(_onListViewItemPushedEvent);
  }

  Future<void> _onListViewItemPushedEvent(
      WbstaticEvent event, Emitter<WbstaticState> emit) async {
    try {
      String key = await storageRepository.getApiKey();
      if (key.isEmpty) {
        emit(FaildState(message: "Вам необходимо сначала добавить ключ API"));
        return;
      }
      IncomesResponse incomeResponse =
          await wbApiRepository.getV1Incomes("2017-03-25T21:00:00.000Z", key);
      int statusCode = incomeResponse.statusCode;
      if (statusCode == 200) {
        List<Supply> supplies = incomeResponse.items;
        if (supplies.isNotEmpty) {
          emit(IncomesState(200, supplies));
          return;
        }
        emit(FaildState(message: "У вас не было поставок."));
      } else {
        emit(FaildState(message: statusCode.toString()));
      }
    } catch (e) {
      log("HomeBloc error: $e");
    }
  }
}
