import 'package:flutter/material.dart';
import 'package:wb_api_repo/wb_api_repo.dart';

class ExpansionPanelRadioBodyOrders extends StatelessWidget {
  const ExpansionPanelRadioBodyOrders({Key? key, required this.order})
      : super(key: key);
  final Order order;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Text('Штрихкод: ${order.barcode}'),
      Text('Бренд: ${order.brand}'),
      Text(order.category),
      Text(order.barcode),
      Text(order.cancelDt),
      Text(order.category),
      Text(order.date),
      Text('${order.discountPercent}'),
      Text(order.gNumber),
      Text(order.lastChangeDate),
      Text('${order.incomeID}'),
      Text('Отмена заказа: ${order.isCancel}'),
      Text(order.lastChangeDate),
      Text('${order.nmId}'),
    ]);
  }
}
