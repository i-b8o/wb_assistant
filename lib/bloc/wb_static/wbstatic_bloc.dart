import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:storage_repo/storage_repo.dart';
import 'package:wb_api_repo/wb_api_repo.dart';
import 'package:wb_assistant/helpers/custom_icons.dart';
import 'package:wb_assistant/models/wb_static_list_view_btn.dart';

part 'wbstatic_event.dart';
part 'wbstatic_state.dart';

class WbstaticBloc extends Bloc<WbstaticEvent, WbstaticState> {
  int currentTab = 100;
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
    String key = "";
    try {
      key = await storageRepository.getApiKey();
      if (key.isEmpty) {
        emit(FaildState(message: "Вам необходимо сначала добавить ключ API"));
        return;
      }
    } catch (e) {
      log("$e", name: "WbstaticBloc");
    }
    if (currentTab == 0) {
      try {
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
        log("$e", name: "WbstaticBloc");
      }
    } else if (currentTab == 1) {
      try {
        StocksResponse stocksResponse =
            await wbApiRepository.getV1Stocks("2017-03-25T21:00:00.000Z", key);
        int statusCode = stocksResponse.statusCode;
        if (statusCode == 200) {
          List<Stock> stocks = stocksResponse.items;
          if (stocks.isNotEmpty) {
            emit(StocksState(200, stocks));
            return;
          }
          emit(FaildState(message: "У вас не было поставок."));
        } else {
          emit(FaildState(message: statusCode.toString()));
        }
      } catch (e) {
        log("$e", name: "WbstaticBloc");
      }
    } else if (currentTab == 2) {
      try {
        OrdersResponse ordersResponse =
            await wbApiRepository.getV1Orders("2022-06-01T21:00:00.000Z", key);
        int statusCode = ordersResponse.statusCode;
        if (statusCode == 200) {
          List<Order> orders = ordersResponse.items;
          if (orders.isNotEmpty) {
            emit(OrdersState(200, orders));
            return;
          }
          emit(FaildState(message: "У вас не было заказов."));
        } else {
          emit(FaildState(message: statusCode.toString()));
        }
      } catch (e) {
        log("$e", name: "WbstaticBloc");
      }
    } else if (currentTab == 3) {
      try {
        SalesResponse salesResponse =
            await wbApiRepository.getV1Sales("2022-06-01T21:00:00.000Z", key);
        int statusCode = salesResponse.statusCode;
        if (statusCode == 200) {
          List<Sale> sales = salesResponse.items;
          if (sales.isNotEmpty) {
            emit(SalesState(200, sales));
            return;
          }
          emit(FaildState(message: "У вас не было продаж."));
        } else {
          emit(FaildState(message: statusCode.toString()));
        }
      } catch (e) {
        log("$e", name: "WbstaticBloc");
      }
    }
  }
}
