import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthProvider {
  static var client = http.Client();
  static const domen = "http://188.93.210.165:8080";
  static const signUpEndPoint = "/auth/sign-up";
  static const signInEndPoint = "/auth/sign-in";
  static const recoverEndPoint = "/auth/recover";
  static const detailsInEndPoint = "/account/details";
  static const resendEndPoint = "/account/update-email-verification-token";
  static const contentType = 'application/json; charset=UTF-8';
  static const contentKey = 'Content-Type';

  Future<http.Response> signUpUser(String email, password, username) async {
    final httpResponse = await client.post(
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
    return httpResponse;
  }

  Future<http.Response> signInUser(String email, password) async {
    final httpResponse = await client.post(
      Uri.parse('$domen$signInEndPoint'),
      headers: <String, String>{
        contentKey: contentType,
      },
      body: jsonEncode(<String, String>{
        'Email': email,
        'Password': password,
      }),
    );
    return httpResponse;
  }

  Future<http.Response> details(String token) async {
    final httpResponse = await client.get(
      Uri.parse('$domen$detailsInEndPoint'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );
    return httpResponse;
  }

  Future<http.Response> resend(String token, email, password) async {
    final httpResponse = await client.post(
      Uri.parse('$domen$resendEndPoint'),
      headers: <String, String>{
        contentKey: contentType,
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, String>{
        'Email': email,
        'Password': password,
      }),
    );
    return httpResponse;
  }

  Future<http.Response> recover(String email) async {
    final httpResponse = await client.post(
      Uri.parse('$domen$recoverEndPoint'),
      headers: <String, String>{
        contentKey: contentType,
      },
      body: jsonEncode(<String, String>{
        'Email': email,
      }),
    );
    return httpResponse;
  }
}
