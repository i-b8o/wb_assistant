import 'dart:async';
import 'dart:convert';
import 'dart:developer';

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
      List<Income> incomes = (json.decode(response.body) as List)
          .map((data) => Income.fromJson(data))
          .toList();
      int incomesLength = incomes.length;
      if (incomesLength == 0) {
        return IncomesResponse(items: [], statusCode: 401);
      }
      List<SupplyItem> supplyItems = [];
      List<Supply> items = [];
      int prevIncomeId = 0;
      Supply supply;
      incomes.sort((a, b) => a.incomeId.compareTo(b.incomeId));
      int i = 0;

      for (var income in incomes) {
        i++;
        int currentIncomeId = income.incomeId;

        // First loop
        if (prevIncomeId == 0) {
          prevIncomeId = currentIncomeId;
        }

        // next income id occured
        if (currentIncomeId != prevIncomeId && incomesLength != i) {
          // Create Supply for prev income ID
          supply = Supply(
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

        SupplyItem supplyItem = SupplyItem(
            id: income.nmId,
            status: income.status,
            article: income.supplierArticle,
            techSize: income.techSize,
            barCode: income.barcode,
            quantity: income.quantity,
            totalPrice: income.totalPrice,
            img:
                'https://images.wbstatic.net/big/new/${income.nmId.toString().replaceRange(4, null, "0000")}/${income.nmId.toString()}-1.jpg');
        // Add it to list
        supplyItems.add(supplyItem);

        // Last iteration
        if (incomesLength == i) {
          // Create Supply
          supply = Supply(
              dateTime: DateTime.parse(income.date),
              warehouseName: income.warehouseName,
              id: prevIncomeId,
              items: supplyItems);
          // Add it to list
          items.add(supply);
        }
      }

      return IncomesResponse(items: items, statusCode: 200);
    }
    return IncomesResponse(statusCode: response.statusCode, items: []);
  }
}
