import 'dart:convert';

import 'package:http/http.dart' as http;

class BeRepository {
  static var client = http.Client();
  static const domen = "http://192.168.31.203:8080";
  static const signUpEndPoint = "/auth/sign-up";
  static const signInEndPoint = "/auth/sign-in";
  static const detailsInEndPoint = "/account/details";
  static const contentType = 'application/json; charset=UTF-8';
  static const contentKey = 'Content-Type';

  static Future<http.Response> signUpUser(
      String email, password, username) async {
    final response = await client.post(
      Uri.parse('$domen$signUpEndPoint'),
      headers: <String, String>{
        contentKey: contentType,
      },
      body: jsonEncode(<String, String>{
        'Email': email,
        'Password': password,
        'Username': username,
      }),
    );

    return response;
  }

  static Future<http.Response> signInUser(String email, password) async {
    final response = await client.post(
      Uri.parse('$domen$signInEndPoint'),
      headers: <String, String>{
        contentKey: contentType,
      },
      body: jsonEncode(<String, String>{
        'Email': email,
        'Password': password,
      }),
    );
    return response;
  }

  static Future<http.Response> details(String token) async {
    print(":REPO:${token}|");
    final response = await client.get(
      Uri.parse('$domen$detailsInEndPoint'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );
    return response;
  }

  // static Future<http.Response> resend(String email, password) async {
  //   final response = await client.post(
  //     Uri.parse('$domen$resendEndPoint'),
  //     headers: <String, String>{
  //       contentKey: contentType,
  //     },
  //     body: jsonEncode(<String, String>{
  //       'Email': email,
  //       'Password': password,
  //     }),
  //   );
  //   return response;
  // }
}
