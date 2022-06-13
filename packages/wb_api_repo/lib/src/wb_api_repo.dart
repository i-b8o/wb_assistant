import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import 'models/models.dart';
import 'provider/wb_api_provider.dart';

// TODO All ***Response to One
class WBApiRepository {
  final WBApiProvider wbApiProvider = WBApiProvider();

  Future<ReportResponse> getV1Report(String dateFrom, dateTo, key) async {
    if (dateFrom.isEmpty || dateTo.isEmpty || key.isEmpty) {
      return ReportResponse(items: [], statusCode: 401);
    }
    final http.Response response =
        await wbApiProvider.reportV1(dateFrom, dateTo, key);
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

  Future<SalesResponse> getV1Sales(String date, key) async {
    if (date.isEmpty || key.isEmpty) {
      return SalesResponse(items: [], statusCode: 401);
    }
    final http.Response response = await wbApiProvider.salesV1(date, key);
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

  Future<OrdersResponse> getV1Orders(String date, key) async {
    if (date.isEmpty || key.isEmpty) {
      return OrdersResponse(items: [], statusCode: 401);
    }
    final http.Response response = await wbApiProvider.ordersV1(date, key);
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

  Future<StocksResponse> getV1Stocks(String date, key) async {
    if (date.isEmpty || key.isEmpty) {
      return StocksResponse(items: [], statusCode: 401);
    }
    final http.Response response = await wbApiProvider.stocksV1(date, key);
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

  Future<IncomesResponse> getV1Incomes(String date, key) async {
    if (date.isEmpty || key.isEmpty) {
      return IncomesResponse(items: [], statusCode: 401);
    }
    final http.Response response = await wbApiProvider.incomesV1(date, key);
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
