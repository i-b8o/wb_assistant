class EndPoints {
  static const domenV1 =
      "https://suppliers-stats.wildberries.ru/api/v1/supplier/";

// Date (2017-03-25T21:00:00.000Z)
// TODO Too much arguments
  static String incomesV1(String date, key) {
    return '${domenV1}incomes?dateFrom=$date&key=$key';
  }

// TODO Too much arguments
  static String stocksV1(String date, key) {
    return '${domenV1}stocks?dateFrom=$date&key=$key';
  }

// TODO Too much arguments
  static String ordersV1(String date, key) {
    return '${domenV1}orders?dateFrom=$date&key=$key';
  }

// TODO Too much arguments
  static String salesV1(String date, key) {
    return '${domenV1}sales?dateFrom=$date&key=$key';
  }

// TODO Too much arguments
  static String reportV1(String dateFrom, dateTo, key) {
    return '${domenV1}reportDetailByPeriod?dateFrom=$dateFrom&key=$key&limit=1000&rrdid=0&dateto=$dateTo';
  }
}
