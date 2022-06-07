// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:wb_api_repo/src/models/supply.dart';

class IncomesResponse {
  List<Supply> items;
  int statusCode;
  IncomesResponse({
    required this.items,
    required this.statusCode,
  });
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
