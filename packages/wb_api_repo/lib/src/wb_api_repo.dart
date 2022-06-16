import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:wb_api_repo/src/models/wb_api_request.dart';

import 'models/models.dart';
import 'provider/wb_api_provider.dart';

class WBApiRepository {
  final WBApiProvider wbApiProvider = WBApiProvider();

  // Get a JSON object from reports API HTTP response then decode it into a WbApiResponse instance or status code 400
  Future<WbApiResponse> getReportsResponse(WbApiRequest req) async {
    if (req.isEmptyAny()) {
      return WbApiResponse(items: [], statusCode: 400);
    }
    final http.Response response =
        await wbApiProvider.fetchReportDetailByPeriod(req);
    // Not OK response
    if (response.statusCode != 200) {
      return WbApiResponse(statusCode: response.statusCode, items: []);
    }
    List<Report> items = (json.decode(response.body) as List)
        .map((data) => Report.fromJson(data))
        .toList();

    if (items.isEmpty) {
      return WbApiResponse(items: [], statusCode: 400);
    }

    return WbApiResponse(items: items, statusCode: 200);
  }

  // Get a JSON object from reports API HTTP response then decode it into a WbApiResponse instance or status code 400
  Future<WbApiResponse> getSalesResponse(WbApiRequest req) async {
    if (req.isEmpty()) {
      return WbApiResponse(items: [], statusCode: 400);
    }
    final http.Response response = await wbApiProvider.fetchSales(req);

    // Not OK response
    if (response.statusCode != 200) {
      return WbApiResponse(statusCode: response.statusCode, items: []);
    }
    List<Sale> items = (json.decode(response.body) as List)
        .map((data) => Sale.fromJson(data))
        .toList();

    if (items.isEmpty) {
      return WbApiResponse(items: [], statusCode: 400);
    }

    return WbApiResponse(items: items, statusCode: 200);
  }

// Get a JSON object from orders API HTTP response then decode it into a WbApiResponse instance or status code 400
  Future<WbApiResponse> getOrdersResponse(WbApiRequest req) async {
    if (req.isEmpty()) {
      return WbApiResponse(items: [], statusCode: 400);
    }
    final http.Response response = await wbApiProvider.fetchOrders(req);

    // Not OK response
    if (response.statusCode != 200) {
      return WbApiResponse(statusCode: response.statusCode, items: []);
    }
    List<Order> items = (json.decode(response.body) as List)
        .map((data) => Order.fromJson(data))
        .toList();
    int itemsLength = items.length;
    if (itemsLength == 0) {
      return WbApiResponse(items: [], statusCode: 400);
    }

    return WbApiResponse(items: items, statusCode: 200);
  }

  // Get a JSON object from stocks API HTTP response then decode it into a WbApiResponse instance or status code 400
  Future<WbApiResponse> getStocksResponse(WbApiRequest req) async {
    if (req.isEmpty()) {
      return WbApiResponse(items: [], statusCode: 400);
    }
    final http.Response response = await wbApiProvider.fetchStocks(req);

    // Not OK response
    if (response.statusCode != 200) {
      return WbApiResponse(statusCode: response.statusCode, items: []);
    }
    List<Stock> items = (json.decode(response.body) as List)
        .map((data) => Stock.fromJson(data))
        .toList();
    int itemsLength = items.length;
    if (itemsLength == 0) {
      return WbApiResponse(items: [], statusCode: 400);
    }

    return WbApiResponse(items: items, statusCode: 200);
  }

  // Get a JSON object from stocks API HTTP response then decode it into a WbApiResponse instance or status code 400
  Future<IncomesResponse> getIncomesResponse(WbApiRequest req) async {
    if (req.isEmpty()) {
      return IncomesResponse(items: [], statusCode: 400);
    }
    final http.Response response = await wbApiProvider.fetchIncomes(req);

    // Not OK response
    if (response.statusCode != 200) {
      return IncomesResponse(statusCode: response.statusCode, items: []);
    }
    List<Income> incomes = (json.decode(response.body) as List)
        .map((data) => Income.fromJson(data))
        .toList();
    int incomesLength = incomes.length;
    if (incomesLength == 0) {
      return IncomesResponse(items: [], statusCode: 400);
    }

    return IncomesResponse.fromIncomesList(incomes);
  }
}
