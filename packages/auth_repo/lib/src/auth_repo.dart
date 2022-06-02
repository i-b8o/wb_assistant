import 'dart:async';
import 'dart:convert';

import 'package:auth_repo/auth_repo.dart';
import 'package:auth_repo/src/provider/auth_provider.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  late final AuthProvider authProvider;

  // Since auth API does not return any payload except a HTTP status code
  // signUpUser returns a status code only
  Future<int> signUpUser(String email, password, username) async {
    final http.Response response =
        await authProvider.signUpUser(email, password, username);

    return response.statusCode;
  }

  // Since auth API returns JWT with 200 HTTP status code or any HTTP status code
  // with message and message is used only for debugging.
  // signInUser returns a HTTP status code and a jwt if exists
  Future<TokenResponse> signInUser(String email, password) async {
    final http.Response response =
        await authProvider.signInUser(email, password);

    final statusCode = response.statusCode;
    if (statusCode == 200) {
      return TokenResponse.fromJson(jsonDecode(response.body));
    }
    return TokenResponse(token: "", statusCode: statusCode);
  }

  // Since auth API returns an user data with 200 HTTP status code or any HTTP status code
  // with a message and the message is used only for debugging.
  // getUser returns a HTTP status code and a user if exists.
  Future<UserResponse> getUser(String token) async {
    final http.Response response = await authProvider.details(token);

    final statusCode = response.statusCode;
    if (statusCode == 200) {
      User user = User.fromJson(jsonDecode(response.body));
      return UserResponse(
        user: user,
      );
    }
    return UserResponse(user: User.empty, statusCode: statusCode);
  }

  // Since auth API does not return any payload except a HTTP status code
  // resend returns a status code only
  Future<int> resend(String token, email, password) async {
    final http.Response response =
        await authProvider.resend(token, email, password);

    return response.statusCode;
  }

  // Since auth API does not return any payload except a HTTP status code
  // resend returns a status code only
  Future<int> recover(String email) async {
    final http.Response response = await authProvider.recover(email);

    return response.statusCode;
  }
}