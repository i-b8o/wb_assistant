class WbApiRequest {
  final String _dateFrom;
  final String _dateTo;
  final String _key;

  WbApiRequest(
      {required String dateFrom, required String dateTo, required String key})
      : _dateFrom = dateFrom,
        _dateTo = dateTo,
        _key = key;
  bool isEmpty() => _dateFrom.isEmpty || _key.isEmpty;
  bool isEmptyAny() => _dateFrom.isEmpty || _key.isEmpty || _dateTo.isEmpty;
  String dateFrom() => _dateFrom;
  String dateTo() => _dateTo;
  String key() => _key;
}
