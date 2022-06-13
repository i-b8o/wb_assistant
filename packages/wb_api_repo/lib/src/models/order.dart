class OrdersResponse {
  List<Order> items;
  int statusCode;
  OrdersResponse({
    required this.items,
    required this.statusCode,
  });
}

class Order {
  final String date;
  final String lastChangeDate;
  final String supplierArticle;
  final int techSize;
  final int barcode;
  final int totalPrice;
  final int discountPercent;
  final String warehouseName;
  final String oblast;
  final String incomeID;
  final String odid;
  final String nmId;
  final String subject;
  final String category;
  final String brand;
  final bool isCancel;
  final String cancelDt;
  final String gNumber;
  final String sticker;
  final String img;

  factory Order.fromJson(Map<String, dynamic> json) {
    int nmID = json['nmId'] ?? 0;
    String nmIDStr = nmID.toString();
    String part = nmID.toString().replaceRange(4, null, "0000");
    String img = 'https://images.wbstatic.net/big/new/$part/$nmIDStr-1.jpg';
    return Order(
      date: json['date'] ?? 0,
      lastChangeDate: json['lastChangeDate'] ?? "",
      supplierArticle: json['supplierArticle'] ?? "",
      techSize: json['techSize'] ?? 0,
      barcode: json['barcode'] ?? 0,
      totalPrice: json['totalPrice'] ?? 0,
      discountPercent: json['discountPercent'] ?? "",
      warehouseName: json['warehouseName'] ?? "",
      oblast: json['oblast'] ?? "",
      incomeID: json['incomeID'] ?? "",
      odid: json['odid'] ?? "",
      nmId: json['nmId'] ?? "",
      subject: json['subject'] ?? 0,
      category: json['category'] ?? 0,
      brand: json['brand'] ?? 0,
      isCancel: json['isCancel'] ?? false,
      cancelDt: json['cancel_dt'] ?? "",
      gNumber: json['gNumber'] ?? "",
      sticker: json['sticker'] ?? "",
      img: img,
    );
  }

  Order({
    required this.date,
    required this.lastChangeDate,
    required this.supplierArticle,
    required this.techSize,
    required this.barcode,
    required this.totalPrice,
    required this.discountPercent,
    required this.warehouseName,
    required this.oblast,
    required this.incomeID,
    required this.odid,
    required this.nmId,
    required this.subject,
    required this.category,
    required this.brand,
    required this.isCancel,
    required this.cancelDt,
    required this.gNumber,
    required this.sticker,
    required this.img,
  });
}
