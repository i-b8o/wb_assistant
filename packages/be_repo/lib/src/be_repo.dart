import 'dart:convert';

import 'package:http/http.dart' as http;

class BeRepository {
  static var client = http.Client();
  static const domen = "http://192.168.31.203:8080";
  static const signUpEndPoint = "/sign-up";
  static const signInEndPoint = "/sign-in";
  static const confirmationEndPoint = "/confirmation/:token";
  static const resendEndPoint = "/resend";
  static const setEndPoint = "/set";
  static const passwordResetEndPoint = "/password-reset";
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

  static Future<http.Response> resend(String email, password) async {
    final response = await client.post(
      Uri.parse('$domen$resendEndPoint'),
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
}
