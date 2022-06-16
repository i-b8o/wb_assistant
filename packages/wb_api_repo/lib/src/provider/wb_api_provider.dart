import 'package:http/http.dart' as http;

import 'endpoints.dart';

class WBApiProvider {
  static var client = http.Client();
  static const contentType = 'application/json; charset=UTF-8';
  static const contentKey = 'Content-Type';
  static const accessControlKey = 'Access-Control-Allow-Headers';
  static const accessControlValue = 'Access-Control-Allow-Origin, Accept';

// TODO Too much arguments
  Future<http.Response> fetchReportDetailByPeriod(
      String dateFrom, dateTo, key) async {
    String url = EndPoints.reportV1(dateFrom, dateTo, key);
    final httpResponse = await client.get(
      Uri.parse(url),
      headers: <String, String>{
        contentKey: contentType,
      },
    );

    return httpResponse;
  }

// TODO Too much arguments
  Future<http.Response> fetchSales(String date, key) async {
    String url = EndPoints.salesV1(date, key);
    final httpResponse = await client.get(
      Uri.parse(url),
      headers: <String, String>{
        contentKey: contentType,
      },
    );

    return httpResponse;
  }

// TODO Too much arguments
  Future<http.Response> fetchOrders(String date, key) async {
    String url = EndPoints.ordersV1(date, key);
    final httpResponse = await client.get(
      Uri.parse(url),
      headers: <String, String>{
        contentKey: contentType,
      },
    );

    return httpResponse;
  }

// TODO Too much arguments
  Future<http.Response> fetchIncomes(String date, key) async {
    String url = EndPoints.incomesV1(date, key);
    final httpResponse = await client.get(
      Uri.parse(url),
      headers: <String, String>{
        contentKey: contentType,
      },
    );

    return httpResponse;
  }

// TODO Too much arguments
  Future<http.Response> fetchStocks(String date, key) async {
    String url = EndPoints.stocksV1(date, key);
    final httpResponse = await client.get(
      Uri.parse(url),
      headers: <String, String>{
        contentKey: contentType,
      },
    );

    return httpResponse;
  }
}
