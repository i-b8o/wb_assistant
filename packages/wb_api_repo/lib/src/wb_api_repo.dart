import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'models/models.dart';
import 'provider/wb_api_provider.dart';

class WBApiRepository {
  final WBApiProvider wbApiProvider = WBApiProvider();

  Future<IncomeResponse> getV1Incomes(String date, key) async {
    final http.Response response = await wbApiProvider.incomesV1(date, key);
    if (response.statusCode == 200) {
      List<Income> incomes = (json.decode(response.body) as List)
          .map((data) => Income.fromJson(data))
          .toList();
      return IncomeResponse(incomes: incomes, statusCode: 200);
    }
    return IncomeResponse(statusCode: response.statusCode, incomes: []);
  }
  // // Since wb_api API does not return any payload except a HTTP status code
  // // signUpUser returns a status code only
  // Future<int> signUpUser(String email, password, username) async {
  //   final http.Response response =
  //       await wbApiProvider.signUpUser(email, password, username);

  //   return response.statusCode;
  // }

  // // Since wb_api API returns JWT with 200 HTTP status code or any HTTP status code
  // // with message and message is used only for debugging.
  // // signInUser returns a HTTP status code and a jwt if exists
  // Future<TokenResponse> signInUser(String email, password) async {
  //   final http.Response response =
  //       await wb_apiProvider.signInUser(email, password);

  //   final statusCode = response.statusCode;
  //   if (statusCode == 200) {
  //     return TokenResponse.fromJson(jsonDecode(response.body));
  //   }
  //   return TokenResponse(token: "", statusCode: statusCode);
  // }

  // // Since wb_api API returns an user data with 200 HTTP status code or any HTTP status code
  // // with a message and the message is used only for debugging.
  // // getUser returns a HTTP status code and a user if exists.
  // Future<UserResponse> getUser(String token) async {
  //   final http.Response response = await wb_apiProvider.details(token);

  //   final statusCode = response.statusCode;
  //   if (statusCode == 200) {
  //     User user = User.fromJson(jsonDecode(response.body));
  //     return UserResponse(
  //       user: user,
  //     );
  //   }
  //   return UserResponse(user: User.empty, statusCode: statusCode);
  // }

  // // Since wb_api API does not return any payload except a HTTP status code
  // // resend returns a status code only
  // Future<int> resend(email, password) async {
  //   final http.Response response = await wb_apiProvider.resend(email, password);

  //   return response.statusCode;
  // }

  // // Since wb_api API does not return any payload except a HTTP status code
  // // resend returns a status code only
  // Future<int> recover(String email) async {
  //   final http.Response response = await wb_apiProvider.recover(email);

  //   return response.statusCode;
  // }

  // // Since wb_api API returns status with 200 HTTP status code or any HTTP status code
  // // with message and message is used only for debugging.
  // // actions returns a HTTP status code and a jwt if exists
  // Future<ActionsResponse> actions(String action) async {
  //   final http.Response response = await wb_apiProvider.actions(action);

  //   final statusCode = response.statusCode;
  //   if (statusCode == 200) {
  //     return ActionsResponse.fromJson(jsonDecode(response.body));
  //   }
  //   return ActionsResponse(status: "", statusCode: statusCode);
  // }
}
