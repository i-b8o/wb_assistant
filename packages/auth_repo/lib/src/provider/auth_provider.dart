import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthProvider {
  static var client = http.Client();
  static const domen = "http://188.93.210.165:8080";
  static const signUpEndPoint = "/auth/sign-up";
  static const signInEndPoint = "/auth/sign-in";
  static const recoverEndPoint = "/auth/recover";
  static const detailsInEndPoint = "/account/details";
  static const actionsInEndPoint = "/account/actions";
  static const resendEndPoint = "/auth/update-email-verification-token";
  static const contentType = 'application/json; charset=UTF-8';
  static const contentKey = 'Content-Type';
  static const accessControlKey = 'Access-Control-Allow-Headers';
  static const accessControlValue = 'Access-Control-Allow-Origin, Accept';

// TODO Too much arguments
// Add comments for method
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

// TODO Too much arguments
// Add comments for method
  Future<http.Response> signInUser(String email, password) async {
    final httpResponse = await client.post(
      Uri.parse('$domen$signInEndPoint'),
      headers: <String, String>{
        contentKey: contentType,
        accessControlKey: accessControlValue
      },
      body: jsonEncode(<String, String>{
        'Email': email,
        'Password': password,
      }),
    );
    return httpResponse;
  }

// TODO Too much arguments
// Add comments for method
  Future<http.Response> details(String token) async {
    final httpResponse = await client.get(
      Uri.parse('$domen$detailsInEndPoint'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );
    return httpResponse;
  }

// TODO Too much arguments
// Add comments for method
  Future<http.Response> resend(String email, password) async {
    final httpResponse = await client.post(
      Uri.parse('$domen$resendEndPoint'),
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

// TODO Too much arguments
// Add comments for method
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

// TODO Too much arguments
// Add comments for method
  Future<http.Response> actions(String action) async {
    final httpResponse = await client.post(
      Uri.parse('$domen$actionsInEndPoint'),
      headers: <String, String>{
        contentKey: contentType,
      },
      body: jsonEncode(<String, String>{
        'action': action,
      }),
    );
    return httpResponse;
  }
}
