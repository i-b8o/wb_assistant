class Order {
  final String date;
  final String lastChangeDate;
  final String supplierArticle;
  final String techSize;
  final String barcode;
  final String totalPrice;
  final int discountPercent;
  final String warehouseName;
  final String oblast;
  final int incomeID;
  final int odid;
  final int nmId;
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
      techSize: json['techSize'] ?? "",
      barcode: json['barcode'] ?? "",
      totalPrice: json['totalPrice'].toString(),
      discountPercent: json['discountPercent'] ?? 0,
      warehouseName: json['warehouseName'] ?? "",
      oblast: json['oblast'] ?? "",
      incomeID: json['incomeID'] ?? 0,
      odid: json['odid'] ?? 0,
      nmId: json['nmId'] ?? 0,
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
