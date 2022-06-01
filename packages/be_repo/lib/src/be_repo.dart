import 'dart:async';
import 'dart:convert';

import 'package:be_repo/be_repo.dart';
import 'package:http/http.dart' as http;
import 'models/token.dart';

enum AuthenticationStatus {
  unknown,
  registered,
  authenticated,
  unauthenticated
}

class BeRepository {
  static var client = http.Client();
  static const domen = "http://188.93.210.165:8080";
  static const signUpEndPoint = "/auth/sign-up";
  static const signInEndPoint = "/auth/sign-in";
  static const recoverEndPoint = "/auth/recover";
  static const detailsInEndPoint = "/account/details";
  static const resendEndPoint = "/account/update-email-verification-token";
  static const contentType = 'application/json; charset=UTF-8';
  static const contentKey = 'Content-Type';

  final controller = StreamController<Response>();

  Future<void> signUpUser(String email, password, username) async {
    final httpresponse = await client.post(
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
    Response response = Response(
      statusCode: httpresponse.statusCode,
      authenticationStatus: AuthenticationStatus.unknown,
      details: Details.empty,
    );
    if (httpresponse.statusCode == 200) {
      Response response = Response(
          authenticationStatus: AuthenticationStatus.registered,
          details: Details.empty);
    }
    controller.sink.add(response);
  }

  Future<void> signInUser(String email, password) async {
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
    Response response = Response(
      statusCode: httpResponse.statusCode,
      authenticationStatus: AuthenticationStatus.unknown,
      details: Details.empty,
    );
    if (httpResponse.statusCode == 200) {
      TokenMessage tokenMessage =
          TokenMessage.fromJson(jsonDecode(httpResponse.body));
      Response response = Response(
          jwt: tokenMessage.token,
          authenticationStatus: AuthenticationStatus.authenticated,
          details: Details.empty);
    }
    controller.sink.add(response);
  }

  Future<void> details(String token) async {
    final httpResponse = await client.get(
      Uri.parse('$domen$detailsInEndPoint'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );
    Response response = Response(
      statusCode: httpResponse.statusCode,
      authenticationStatus: AuthenticationStatus.unknown,
      details: Details.empty,
    );
    if (httpResponse.statusCode == 200) {
      Details details = Details.fromJson(jsonDecode(httpResponse.body));
      Response response = Response(
          authenticationStatus: AuthenticationStatus.authenticated,
          details: details);
    }
    controller.sink.add(response);
  }

  Future<void> resend(String token, email, password) async {
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
    Response response = Response(
      statusCode: httpResponse.statusCode,
      authenticationStatus: AuthenticationStatus.unknown,
      details: Details.empty,
    );

    controller.sink.add(response);
  }

  Future<void> recover(String email) async {
    print("Email: $email");
    final httpResponse = await client.post(
      Uri.parse('$domen$recoverEndPoint'),
      headers: <String, String>{
        contentKey: contentType,
      },
      body: jsonEncode(<String, String>{
        'Email': email,
      }),
    );
    Response response = Response(
      statusCode: httpResponse.statusCode,
      authenticationStatus: AuthenticationStatus.unknown,
      details: Details.empty,
    );

    controller.sink.add(response);
  }
}
