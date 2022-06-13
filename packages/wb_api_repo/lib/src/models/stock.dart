class StocksResponse {
  List<Stock> items;
  int statusCode;
  StocksResponse({
    required this.items,
    required this.statusCode,
  });
}

class Stock {
  final String lastChangeDate;
  final String supplierArticle;
  final String techSize;
  final String barcode;
  final int quantity;
  final bool isSupply;
  final bool isRealization;
  final int quantityFull;
  final int quantityNotInOrders;
  final int warehouse;
  final String warehouseName;
  final int inWayToClient;
  final int inWayFromClient;
  final int nmId;
  final String subject;
  final String category;
  final int daysOnSite;
  final String brand;
  final String sCCode;
  final int price;
  final int discount;
  final String img;

  const Stock({
    required this.lastChangeDate,
    required this.supplierArticle,
    required this.techSize,
    required this.barcode,
    required this.quantity,
    required this.isSupply,
    required this.isRealization,
    required this.quantityFull,
    required this.quantityNotInOrders,
    required this.warehouse,
    required this.warehouseName,
    required this.inWayToClient,
    required this.inWayFromClient,
    required this.nmId,
    required this.subject,
    required this.category,
    required this.daysOnSite,
    required this.brand,
    required this.sCCode,
    required this.price,
    required this.discount,
    required this.img,
  });

  factory Stock.fromJson(Map<String, dynamic> json) {
    int nmID = json['nmId'] ?? 0;
    String nmIDStr = nmID.toString();
    String part = nmID.toString().replaceRange(4, null, "0000");
    String img = 'https://images.wbstatic.net/big/new/$part/$nmIDStr-1.jpg';
    return Stock(
      lastChangeDate: json['lastChangeDate'] ?? "",
      supplierArticle: json['supplierArticle'] ?? "",
      techSize: json['techSize'] ?? "",
      barcode: json['barcode'] ?? "",
      quantity: json['quantity'] ?? 0,
      isSupply: json['isSupply'] ?? false,
      isRealization: json['isRealization'] ?? false,
      quantityFull: json['quantityFull'] ?? 0,
      quantityNotInOrders: json['quantityNotInOrders'] ?? 0,
      warehouse: json['warehouse'] ?? 0,
      warehouseName: json['warehouseName'] ?? "",
      inWayToClient: json['inWayToClient'] ?? 0,
      inWayFromClient: json['inWayFromClient'] ?? 0,
      nmId: json['nmId'] ?? 0,
      subject: json['subject'] ?? "",
      category: json['category'] ?? "",
      daysOnSite: json['daysOnSite'] ?? 0,
      brand: json['brand'] ?? "",
      sCCode: json['sCCode'] ?? "",
      price: json['price'] ?? 0,
      discount: json['discount'] ?? 0,
      img: img,
    );
  }
}
