class Supply {
  final DateTime dateTime;
  final String warehouseName;
  final int id;
  // final dateTime = DateTime.parse(dateTimeString);
  List<SupplyItem> items;

  Supply(
      {required this.dateTime,
      required this.warehouseName,
      required this.id,
      required this.items});
}

class SupplyItem {
  final int id;
  final String status;
  final String article;
  final String techSize;
  final String barCode;
  final int quantity;
  final int totalPrice;
  final String img;

  SupplyItem(
      {required this.img,
      required this.id,
      required this.status,
      required this.article,
      required this.techSize,
      required this.barCode,
      required this.quantity,
      required this.totalPrice});
}
