import 'dart:convert';

import 'package:http/http.dart' as http;

enum RegistrationStatus { success, fail }

class BeRepository {
  static var client = http.Client();

  static Future<http.Response> loginUser(String email, password) async {
    final response = await client.post(
      Uri.parse('http://192.168.31.203:8080/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );
    return response;
  }

  Future<http.Response> registerUser(String name, email, password) async {
    final response = await client.post(
      Uri.parse('http://192.168.31.203:8080/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'Username': name,
        'Email': email,
        'Password': password,
      }),
    );

    return response;
  }

  Future<http.Response> resend(String email, password) async {
    final response = await client.post(
      Uri.parse('http://192.168.31.203:8080/resend'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'Email': email,
        'Password': password,
      }),
    );
    return response;
  }
}
