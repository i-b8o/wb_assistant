import 'package:http/http.dart' as http;

import 'endpoints.dart';

class WBApiProvider {
  static var client = http.Client();
  static const contentType = 'application/json; charset=UTF-8';
  static const contentKey = 'Content-Type';
  static const accessControlKey = 'Access-Control-Allow-Headers';
  static const accessControlValue = 'Access-Control-Allow-Origin, Accept';

  Future<http.Response> ordersV1(String date, key) async {
    String url = EndPoints.ordersV1(date, key);
    final httpResponse = await client.get(
      Uri.parse(url),
      headers: <String, String>{
        contentKey: contentType,
      },
    );

    return httpResponse;
  }

  Future<http.Response> incomesV1(String date, key) async {
    String url = EndPoints.incomesV1(date, key);
    final httpResponse = await client.get(
      Uri.parse(url),
      headers: <String, String>{
        contentKey: contentType,
      },
    );

    return httpResponse;
  }

  Future<http.Response> stocksV1(String date, key) async {
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
