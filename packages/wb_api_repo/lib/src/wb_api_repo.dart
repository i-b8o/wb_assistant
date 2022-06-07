import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wb_api_repo/src/models/supply.dart';

import 'models/models.dart';
import 'provider/wb_api_provider.dart';

class WBApiRepository {
  final WBApiProvider wbApiProvider = WBApiProvider();

  Future<IncomesResponse> getV1Incomes(String date, key) async {
    final http.Response response = await wbApiProvider.incomesV1(date, key);
    if (response.statusCode == 200) {
      print(response.body);
      List<Income> incomes = (json.decode(response.body) as List)
          .map((data) => Income.fromJson(data))
          .toList();
      List<Supply> items = [];
      int prevIncomeId = incomes.first.incomeId;
      Supply currentSupply;

      for (var income in incomes) {
        int currentIncomeId = income.incomeId;
        currentSupply.dateTime = DateTime.parse(income.dateClose);
        if (currentIncomeId != prevIncomeId) {
          currentIncomeId = income.incomeId;
          items.add(currentSupply);
        }
      }
      return IncomesResponse(items: items, statusCode: 200);
    }
    return IncomesResponse(statusCode: response.statusCode, items: []);
  }
}
