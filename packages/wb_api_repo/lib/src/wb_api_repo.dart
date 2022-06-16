import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import 'models/models.dart';
import 'models/wb_api_response.dart';
import 'provider/wb_api_provider.dart';

// TODO All ***Response to One
class WBApiRepository {
  final WBApiProvider wbApiProvider = WBApiProvider();

// TODO Refactor: function must do one thing
// TODO Too much arguments
  Future<ReportResponse> getReportsResponse(
      String dateFrom, dateTo, key) async {
    if (dateFrom.isEmpty || dateTo.isEmpty || key.isEmpty) {
      return ReportResponse(items: [], statusCode: 401);
    }
    final http.Response response =
        await wbApiProvider.fetchReportDetailByPeriod(dateFrom, dateTo, key);
    log(response.body);
    if (response.statusCode == 200) {
      List<Report> items = (json.decode(response.body) as List)
          .map((data) => Report.fromJson(data))
          .toList();
      int itemsLength = items.length;
      if (itemsLength == 0) {
        return ReportResponse(items: [], statusCode: 401);
      }

      return ReportResponse(items: items, statusCode: 200);
    }
    return ReportResponse(statusCode: response.statusCode, items: []);
  }

// TODO Refactor: function must do one thing
// TODO Too much arguments
  Future<SalesResponse> getSalesResponse(String date, key) async {
    if (date.isEmpty || key.isEmpty) {
      return SalesResponse(items: [], statusCode: 401);
    }
    final http.Response response = await wbApiProvider.fetchSales(date, key);
    log(response.body);
    if (response.statusCode == 200) {
      List<Sale> items = (json.decode(response.body) as List)
          .map((data) => Sale.fromJson(data))
          .toList();
      int itemsLength = items.length;
      if (itemsLength == 0) {
        return SalesResponse(items: [], statusCode: 401);
      }

      return SalesResponse(items: items, statusCode: 200);
    }
    return SalesResponse(statusCode: response.statusCode, items: []);
  }

// TODO Refactor: function must do one thing
// TODO Too much arguments
  Future<OrdersResponse> getOrdersResponse(String date, key) async {
    if (date.isEmpty || key.isEmpty) {
      return OrdersResponse(items: [], statusCode: 401);
    }
    final http.Response response = await wbApiProvider.fetchOrders(date, key);
    log(response.body);
    if (response.statusCode == 200) {
      List<Order> items = (json.decode(response.body) as List)
          .map((data) => Order.fromJson(data))
          .toList();
      int itemsLength = items.length;
      if (itemsLength == 0) {
        return OrdersResponse(items: [], statusCode: 401);
      }

      return OrdersResponse(items: items, statusCode: 200);
    }
    return OrdersResponse(statusCode: response.statusCode, items: []);
  }

// TODO Refactor: function must do one thing
// TODO Too much arguments
  Future<StocksResponse> getStocksResponse(String date, key) async {
    if (date.isEmpty || key.isEmpty) {
      return StocksResponse(items: [], statusCode: 401);
    }
    final http.Response response = await wbApiProvider.fetchStocks(date, key);
    log(response.body);
    if (response.statusCode == 200) {
      List<Stock> items = (json.decode(response.body) as List)
          .map((data) => Stock.fromJson(data))
          .toList();
      int itemsLength = items.length;
      if (itemsLength == 0) {
        return StocksResponse(items: [], statusCode: 401);
      }

      return StocksResponse(items: items, statusCode: 200);
    }
    return StocksResponse(statusCode: response.statusCode, items: []);
  }

// TODO Refactor: function must do one thing
  Future<IncomesResponse> getIncomesResponse(String date, key) async {
    if (date.isEmpty || key.isEmpty) {
      return IncomesResponse(items: [], statusCode: 401);
    }
    final http.Response response = await wbApiProvider.fetchIncomes(date, key);
    log(response.body);
    if (response.statusCode == 200) {
      List<Income> incomes = (json.decode(response.body) as List)
          .map((data) => Income.fromJson(data))
          .toList();
      int incomesLength = incomes.length;
      if (incomesLength == 0) {
        return IncomesResponse(items: [], statusCode: 401);
      }

      return IncomesResponse.fromIncomesList(incomes);
    }
    return IncomesResponse(statusCode: response.statusCode, items: []);
  }
}
