class SalesResponse {
  List<Sale> items;
  int statusCode;
  SalesResponse({
    required this.items,
    required this.statusCode,
  });
}

class Sale {
  final String date;
  final String lastChangeDate;
  final String supplierArticle;
  final String techSize;
  final String barcode;
  final String totalPrice;
  final int discountPercent;
  final bool isSupply;
  final bool isRealization;
  final int promoCodeDiscount;
  final String warehouseName;
  final String countryName;
  final String oblastOkrugName;
  final String regionName;
  final int incomeID;
  final String saleID;
  final int odid;
  final int spp;
  final String forPay;
  final String finishedPrice;
  final String priceWithDisc;
  final int nmId;
  final String subject;
  final String category;
  final String brand;
  final int isStorno;
  final String gNumber;
  final String sticker;
  final String img;

  factory Sale.fromJson(Map<String, dynamic> json) {
    int nmID = json['nmId'] ?? 0;
    String nmIDStr = nmID.toString();
    String part = nmID.toString().replaceRange(4, null, "0000");
    String img = 'https://images.wbstatic.net/big/new/$part/$nmIDStr-1.jpg';
    return Sale(
      date: json['date'] ?? "",
      lastChangeDate: json['lastChangeDate'] ?? "",
      supplierArticle: json['supplierArticle'] ?? "",
      techSize: json['techSize'] ?? "",
      barcode: json['barcode'] ?? "",
      totalPrice: json['totalPrice'].toString(),
      discountPercent: json['discountPercent'] ?? "",
      isSupply: json['isSupply'] ?? "",
      isRealization: json['isRealization'] ?? "",
      promoCodeDiscount: json['promoCodeDiscount'] ?? "",
      warehouseName: json['warehouseName'] ?? "",
      countryName: json['countryName'] ?? "",
      oblastOkrugName: json['oblastOkrugName'] ?? "",
      regionName: json['regionName'] ?? "",
      incomeID: json['incomeID'] ?? "",
      saleID: json['saleID'] ?? "",
      odid: json['odid'] ?? "",
      spp: json['spp'] ?? "",
      forPay: json['forPay'].toString(),
      finishedPrice: json['finishedPrice'].toString(),
      priceWithDisc: json['priceWithDisc'].toString(),
      nmId: json['nmId'] ?? "",
      subject: json['subject'] ?? "",
      category: json['category'] ?? "",
      brand: json['brand'] ?? "",
      isStorno: json['IsStorno'] ?? "",
      gNumber: json['gNumber'] ?? "",
      sticker: json['sticker'] ?? "",
      img: img,
    );
  }

  Sale(
      {required this.date,
      required this.lastChangeDate,
      required this.supplierArticle,
      required this.techSize,
      required this.barcode,
      required this.totalPrice,
      required this.discountPercent,
      required this.isSupply,
      required this.isRealization,
      required this.promoCodeDiscount,
      required this.warehouseName,
      required this.countryName,
      required this.oblastOkrugName,
      required this.regionName,
      required this.incomeID,
      required this.saleID,
      required this.odid,
      required this.spp,
      required this.forPay,
      required this.finishedPrice,
      required this.priceWithDisc,
      required this.nmId,
      required this.subject,
      required this.category,
      required this.brand,
      required this.isStorno,
      required this.gNumber,
      required this.sticker,
      required this.img});
}
