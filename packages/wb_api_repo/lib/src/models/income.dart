import 'models.dart';

class IncomesResponse {
  List<Supply> items;
  int statusCode;
  IncomesResponse({
    required this.items,
    required this.statusCode,
  });

  static IncomesResponse fromIncomesList(List<Income> incomes) {
    List<SupplyItem> supplyItems = [];
    List<Supply> items = [];
    int prevIncomeId = 0;
    Supply supply;
    incomes.sort((a, b) => a.incomeId.compareTo(b.incomeId));
    int i = 0;
    Income firstIncome = incomes.first;
    for (var income in incomes) {
      i++;
      int currentIncomeId = income.incomeId;

      // First loop
      if (prevIncomeId == 0) {
        prevIncomeId = currentIncomeId;
      }

      // next income id occured
      if (currentIncomeId != prevIncomeId && incomes.length != i) {
        // Create Supply for prev income ID
        if (items.isEmpty) {
          supply = Supply(
              dateTime: DateTime.parse(firstIncome.date),
              warehouseName: firstIncome.warehouseName,
              id: prevIncomeId,
              items: supplyItems);
        } else {
          supply = Supply(
              dateTime: DateTime.parse(income.date),
              warehouseName: income.warehouseName,
              id: prevIncomeId,
              items: supplyItems);
        }

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
      if (incomes.length == i) {
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
}

class Income {
  final int incomeId;
  final String number;
  final String date;
  final String lastChangeDate;
  final String supplierArticle;
  final String techSize;
  final String barcode;
  final int quantity;
  final int totalPrice;
  final String dateClose;
  final String warehouseName;
  final int nmId;
  final String status;
  final String img;

  const Income({
    required this.incomeId,
    required this.number,
    required this.date,
    required this.lastChangeDate,
    required this.supplierArticle,
    required this.techSize,
    required this.barcode,
    required this.quantity,
    required this.totalPrice,
    required this.dateClose,
    required this.warehouseName,
    required this.nmId,
    required this.status,
    required this.img,
  });

  factory Income.fromJson(Map<String, dynamic> json) {
    int nmID = json['nmId'] ?? 0;
    String nmIDStr = nmID.toString();
    String part = nmID.toString().replaceRange(4, null, "0000");
    String img = 'https://images.wbstatic.net/big/new/$part/$nmIDStr-1.jpg';
    return Income(
      incomeId: json['incomeId'] ?? 0,
      number: json['number'] ?? "",
      date: json['date'] ?? "",
      lastChangeDate: json['lastChangeDate'] ?? "",
      supplierArticle: json['supplierArticle'] ?? "",
      techSize: json['techSize'] ?? "",
      barcode: json['barcode'] ?? "",
      quantity: json['quantity'] ?? 0,
      totalPrice: json['totalPrice'] ?? 0,
      dateClose: json['dateClose'] ?? "",
      warehouseName: json['warehouseName'] ?? "",
      nmId: nmID,
      status: json['status'] ?? "",
      img: img,
    );
  }

  static const empty = Income(
    incomeId: 0,
    number: "",
    date: "",
    lastChangeDate: "",
    supplierArticle: "",
    techSize: "",
    barcode: "",
    quantity: 0,
    totalPrice: 0,
    dateClose: "",
    warehouseName: "",
    nmId: 0,
    status: "",
    img: "",
  );
}
