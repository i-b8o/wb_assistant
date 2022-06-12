import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:storage_repo/storage_repo.dart';
import 'package:wb_api_repo/wb_api_repo.dart';

part 'wbstatic_event.dart';
part 'wbstatic_state.dart';

class WbstaticBloc extends Bloc<WbstaticEvent, WbstaticState> {
  WBApiRepository wbApiRepository = WBApiRepository();
  StorageRepository storageRepository = StorageRepository();
  WbstaticBloc() : super(WbstaticInitial()) {
    on<IncomesPressedEvent>(_onIncomesPressedEvent);
    on<StocksPressedEvent>(_onStocksPressedEvent);
    on<OrdersPressedEvent>(_onOrdersPressedEvent);
    on<SalesPressedEvent>(_onSalesPressedEvent);
    on<ReportPressedEvent>(_onReportPressedEvent);
    on<ExciseGoodsPressedEvent>(_onExciseGoodsPressedEvent);
  }

  Future<void> _onIncomesPressedEvent(
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

  Future<void> _onStocksPressedEvent(
      WbstaticEvent event, Emitter<WbstaticState> emit) async {}
  Future<void> _onOrdersPressedEvent(
      WbstaticEvent event, Emitter<WbstaticState> emit) async {}
  Future<void> _onSalesPressedEvent(
      WbstaticEvent event, Emitter<WbstaticState> emit) async {}
  Future<void> _onReportPressedEvent(
      WbstaticEvent event, Emitter<WbstaticState> emit) async {}
  Future<void> _onExciseGoodsPressedEvent(
      WbstaticEvent event, Emitter<WbstaticState> emit) async {}
}
