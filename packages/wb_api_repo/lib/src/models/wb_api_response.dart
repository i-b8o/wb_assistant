abstract class Response {
  List<Object> items();
  int statusCode();
}

class WbApiResponse implements Response {
  final List<Object> _items;
  final int _statusCode;
  WbApiResponse({
    required List<Object> items,
    required int statusCode,
  })  : _items = items,
        _statusCode = statusCode;

  @override
  int statusCode() => _statusCode;
  @override
  List<Object> items() => _items;
}
