import 'dart:convert';

import 'package:http/http.dart' as http;

import 'endpoints.dart';

class WBApiProvider {
  static var client = http.Client();

  // static const incomesV1 = "incomes?dateFrom=2017-03-25T21:00:00.000Z&key=YTY5YmUxYWQtYWIyNi00YmU4LThjODctNjA2YmYzNTA1ZDk5";
  // static const signInEndPoint = "/auth/sign-in";
  // static const recoverEndPoint = "/auth/recover";
  // static const detailsInEndPoint = "/account/details";
  // static const actionsInEndPoint = "/account/actions";
  // static const resendEndPoint = "/auth/update-email-verification-token";
  static const contentType = 'application/json; charset=UTF-8';
  static const contentKey = 'Content-Type';
  static const accessControlKey = 'Access-Control-Allow-Headers';
  static const accessControlValue = 'Access-Control-Allow-Origin, Accept';

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

  // Future<http.Response> signInUser(String email, password) async {
  //   final httpResponse = await client.post(
  //     Uri.parse('$domen$signInEndPoint'),
  //     headers: <String, String>{
  //       contentKey: contentType,
  //       accessControlKey: accessControlValue
  //     },
  //     body: jsonEncode(<String, String>{
  //       'Email': email,
  //       'Password': password,
  //     }),
  //   );
  //   return httpResponse;
  // }

  // Future<http.Response> details(String token) async {
  //   final httpResponse = await client.get(
  //     Uri.parse('$domen$detailsInEndPoint'),
  //     headers: <String, String>{
  //       'Authorization': 'Bearer $token',
  //     },
  //   );
  //   return httpResponse;
  // }

  // Future<http.Response> resend(String email, password) async {
  //   final httpResponse = await client.post(
  //     Uri.parse('$domen$resendEndPoint'),
  //     headers: <String, String>{
  //       contentKey: contentType,
  //     },
  //     body: jsonEncode(<String, String>{
  //       'Email': email,
  //       'Password': password,
  //     }),
  //   );

  //   return httpResponse;
  // }

  // Future<http.Response> recover(String email) async {
  //   final httpResponse = await client.post(
  //     Uri.parse('$domen$recoverEndPoint'),
  //     headers: <String, String>{
  //       contentKey: contentType,
  //     },
  //     body: jsonEncode(<String, String>{
  //       'Email': email,
  //     }),
  //   );
  //   return httpResponse;
  // }

  // Future<http.Response> actions(String action) async {
  //   final httpResponse = await client.post(
  //     Uri.parse('$domen$actionsInEndPoint'),
  //     headers: <String, String>{
  //       contentKey: contentType,
  //     },
  //     body: jsonEncode(<String, String>{
  //       'action': action,
  //     }),
  //   );
  //   return httpResponse;
  // }
}
