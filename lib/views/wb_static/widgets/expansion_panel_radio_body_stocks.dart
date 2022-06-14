import 'package:flutter/material.dart';
import 'package:wb_api_repo/wb_api_repo.dart';

class ExpansionPanelRadioBodyStocks extends StatelessWidget {
  const ExpansionPanelRadioBodyStocks({Key? key, required this.stock})
      : super(key: key);
  final Stock stock;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Text('Дата обновления: ${stock.lastChangeDate}'),
      Text('Артикул поставщика: ${stock.supplierArticle}'),
      Text('Размер: ${stock.techSize}'),
      Text('Штрих-код: ${stock.barcode}'),
      Text('Кол-во доступное для продажи: ${stock.quantity}'),
      Text('Договор поставки: ${stock.isSupply}'),
      Text('Договор реализации: ${stock.isRealization}'),
      Text('Кол-во полное: ${stock.quantityFull}'),
      Text('Кол-во не в заказе: ${stock.quantityNotInOrders}'),
      Text('В пути к клиенту (штук): ${stock.inWayToClient}'),
      Text('В пути от клиента (штук): ${stock.inWayFromClient}'),
      Text('Код WB: ${stock.nmId}'),
      Text('Предмет: ${stock.subject}'),
      Text('Категория: ${stock.category}'),
      Text('Кол-во дней на сайте: ${stock.daysOnSite}'),
      Text('Бренд: ${stock.brand}'),
      Text('Код контракта: ${stock.sCCode}'),
      Text('Уникальный идентификатор склада: ${stock.warehouse}'),
      Text('Цена товара: ${stock.price}'),
      Text('Скидка на товар установленная продавцом: ${stock.discount}'),
    ]);
  }
}
