import 'models.dart';

abstract class WbApiResponse {
  List<Object> items();
  int statusCode();
}

class OrdersResponse implements WbApiResponse {
  final List<Order> _items;
  final int _statusCode;
  OrdersResponse({
    required List<Order> items,
    required int statusCode,
  })  : _items = items,
        _statusCode = statusCode;

  @override
  int statusCode() => _statusCode;
  @override
  List<Order> items() => _items;
}
