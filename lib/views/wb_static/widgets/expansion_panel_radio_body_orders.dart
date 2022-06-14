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
      const Text('Номер заказа:'),
      Text(order.gNumber),
      const Text('Номер поставки:'),
      Text('${order.incomeID}'),
      const Text('Дата обновления информации в сервисе:'),
      Text(order.lastChangeDate),
      Text('Размер: ${order.techSize}'),
      Text('Штрих-код: ${order.barcode}'),
      const Text('Цена до скидки/промо/спп:'),
      Text(order.totalPrice),
      const Text('Итоговый дисконт:'),
      Text('${order.discountPercent}'),
      const Text('Склад отгрузки:'),
      Text(order.warehouseName),
      Text('Область: ${order.oblast}'),
      const Text('Уникальный идентификатор позиции заказа:'),
      Text('${order.odid}'),
      Text('Код WB: ${order.nmId}'),
      Text('Предмет: ${order.subject}'),
      Text('Категория: ${order.category}'),
      Text('Бренд: ${order.brand}'),
      Text(order.cancelDt),
      Text(order.sticker),
    ]);
  }
}
