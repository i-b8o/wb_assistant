class EndPoints {
  static const domenV1 =
      "https://suppliers-stats.wildberries.ru/api/v1/supplier/";

// Date (2017-03-25T21:00:00.000Z)
  static String incomesV1(String date, key) {
    return '${domenV1}incomes?dateFrom=$date&key=$key';
  }

  static String stocksV1(String date, key) {
    return '${domenV1}stocks?dateFrom=$date&key=$key';
  }

  static String ordersV1(String date, key) {
    return '${domenV1}orders?dateFrom=$date&key=$key';
  }
}
