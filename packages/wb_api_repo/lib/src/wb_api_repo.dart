import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'models/models.dart';
import 'provider/wb_api_provider.dart';

class WBApiRepository {
  final WBApiProvider wbApiProvider = WBApiProvider();

  Future<IncomesResponse> getV1Incomes(String date, key) async {
    if (date.isEmpty || key.isEmpty) {
      return IncomesResponse(items: [], statusCode: 401);
    }
    final http.Response response = await wbApiProvider.incomesV1(date, key);
    if (response.statusCode == 200) {
      print(response.body);
      List<Income> incomes = (json.decode(response.body) as List)
          .map((data) => Income.fromJson(data))
          .toList();

      List<SupplyItem> supplyItems = [];
      List<Supply> items = [];
      int prevIncomeId = 0;

      incomes.sort((a, b) => a.incomeId.compareTo(b.incomeId));

      for (var income in incomes) {
        // If next income id occured
        int currentIncomeId = income.incomeId;
        if (currentIncomeId != prevIncomeId) {
          // Create Supply
          Supply supply = Supply(
              dateTime: DateTime.parse(income.date),
              warehouseName: income.warehouseName,
              id: prevIncomeId,
              items: supplyItems);
          // Add it to list
          items.add(supply);
          // Reset variables
          prevIncomeId = currentIncomeId;
          supplyItems = [];
        }
        // If products from previous income create supply item (product)
        SupplyItem supplyItem = SupplyItem(
            id: income.nmId,
            status: income.status,
            article: income.supplierArticle,
            techSize: income.techSize,
            barCode: income.barcode,
            quantity: income.quantity,
            totalPrice: income.totalPrice);
        // Add it to list
        supplyItems.add(supplyItem);
      }
      return IncomesResponse(items: items, statusCode: 200);
    }
    return IncomesResponse(statusCode: response.statusCode, items: []);
  }
}
