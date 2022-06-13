part of 'wbstatic_bloc.dart';

abstract class WbstaticState {}

class WbstaticInitial extends WbstaticState {}

class IncomesState extends WbstaticState {
  final int statusCode;
  final List<Supply> supplies;

  IncomesState(this.statusCode, this.supplies);
}

class StocksState extends WbstaticState {
  final int statusCode;
  final List<Stock> stocks;

  StocksState(this.statusCode, this.stocks);
}

class OrdersState extends WbstaticState {
  final int statusCode;
  final List<Order> orders;

  OrdersState(this.statusCode, this.orders);
}

class SalesState extends WbstaticState {}

class ReportState extends WbstaticState {}

class ExciseGoodsState extends WbstaticState {}

class FaildState extends WbstaticState {
  final String message;

  FaildState({required this.message});
}
