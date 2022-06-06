// ignore_for_file: public_member_api_docs, sort_constructors_first
class IncomeResponse {
  List<Income>? incomes;
  int statusCode;
  IncomeResponse({
    this.incomes,
    required this.statusCode,
  });
}

class Income {
  final int incomeId;
  final String number;
  final String date;
  final String lastChangeDate;
  final String supplierArticle;
  final int techSize;
  final int barcode;
  final int quantity;
  final int totalPrice;
  final String dateClose;
  final String warehouseName;
  final int nmId;
  final String status;

  const Income(
      {required this.incomeId,
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
      required this.status});

  factory Income.fromJson(Map<String, dynamic> json) {
    return Income(
      incomeId: json['incomeId'] ?? 0,
      number: json['number'] ?? "",
      date: json['date'] ?? "",
      lastChangeDate: json['lastChangeDate'] ?? "",
      supplierArticle: json['supplierArticle'] ?? "",
      techSize: json['techSize'] ?? 0,
      barcode: json['barcode'] ?? 0,
      quantity: json['quantity'] ?? 0,
      totalPrice: json['totalPrice'] ?? 0,
      dateClose: json['dateClose'] ?? "",
      warehouseName: json['warehouseName'] ?? "",
      nmId: json['nmId'] ?? 0,
      status: json['status'] ?? "",
    );
  }

  static const empty = Income(
    incomeId: 0,
    number: "",
    date: "",
    lastChangeDate: "",
    supplierArticle: "",
    techSize: 0,
    barcode: 0,
    quantity: 0,
    totalPrice: 0,
    dateClose: "",
    warehouseName: "",
    nmId: 0,
    status: "",
  );
}
