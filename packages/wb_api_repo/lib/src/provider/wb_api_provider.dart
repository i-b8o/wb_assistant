import 'package:http/http.dart' as http;
import 'package:wb_api_repo/src/models/wb_api_request.dart';

import 'endpoints.dart';

class WBApiProvider {
  static var client = http.Client();
  static const contentType = 'application/json; charset=UTF-8';
  static const contentKey = 'Content-Type';

// Sends the request to the stocks endpoint and returns http response
  Future<http.Response> fetchStocks(WbApiRequest req) async {
    String url = EndPoints.stocksV1(req.dateFrom(), req.key());
    final httpResponse = await client.get(
      Uri.parse(url),
      headers: <String, String>{
        contentKey: contentType,
      },
    );

    return httpResponse;
  }

// Sends the request to the orders endpoint and returns http response
  Future<http.Response> fetchOrders(WbApiRequest req) async {
    String url = EndPoints.ordersV1(req.dateFrom(), req.key());
    final httpResponse = await client.get(
      Uri.parse(url),
      headers: <String, String>{
        contentKey: contentType,
      },
    );

    return httpResponse;
  }

// Sends the request to the sales endpoint and returns http response
  Future<http.Response> fetchSales(WbApiRequest req) async {
    String url = EndPoints.salesV1(req.dateFrom(), req.key());
    final httpResponse = await client.get(
      Uri.parse(url),
      headers: <String, String>{
        contentKey: contentType,
      },
    );

    return httpResponse;
  }

// Sends the request to the incomes endpoint and returns http response
  Future<http.Response> fetchIncomes(WbApiRequest req) async {
    String url = EndPoints.incomesV1(req.dateFrom(), req.key());
    final httpResponse = await client.get(
      Uri.parse(url),
      headers: <String, String>{
        contentKey: contentType,
      },
    );

    return httpResponse;
  }

  // Sends the request to the report endpoint and returns http response
  Future<http.Response> fetchReportDetailByPeriod(WbApiRequest req) async {
    String url = EndPoints.reportV1(req.dateFrom(), req.dateTo(), req.key());
    final httpResponse = await client.get(
      Uri.parse(url),
      headers: <String, String>{
        contentKey: contentType,
      },
    );

    return httpResponse;
  }
}
