import 'package:flutter/material.dart';
import 'package:wb_api_repo/wb_api_repo.dart';

class ExpansionPanelRadioBodySales extends StatelessWidget {
  const ExpansionPanelRadioBodySales({Key? key, required this.sale})
      : super(key: key);
  final Sale sale;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Text('Дата обновления информации в сервисе:\n${sale.lastChangeDate}'),
      Text('Артикул: ${sale.supplierArticle}'),
      Text('Размер: ${sale.techSize}'),
      Text('Штрих-код: ${sale.barcode}'),
      Text('Начальная розничная цена товара: ${sale.totalPrice}'),
      Text('Согласованная скидка на товар: ${sale.discountPercent}'),
      Text('Договор поставки: ${sale.isSupply}'),
      Text('Договор реализации: ${sale.isRealization}'),
      Text('Промокод: ${sale.promoCodeDiscount}'),
      Text('Страна: ${sale.countryName}'),
      Text('Округ: ${sale.oblastOkrugName}'),
      Text('Округ: ${sale.regionName}'),
      Text('Номер поставки: ${sale.incomeID}'),
      Text('Уникальный идентификатор продажи/возврата: ${sale.saleID}'),
      Text('Уникальный идентификатор позиции заказа: ${sale.odid}'),
      Text('Согласованная скидка постоянного покупателя (СПП): ${sale.spp}'),
      Text('К перечислению поставщику: ${sale.forPay}'),
      Text(
          'Фактическая цена из заказа (с учетом всех скидок, включая и от ВБ): ${sale.finishedPrice}'),
      Text(
          'Цена, от которой считается вознаграждение поставщика forpay (с учетом всех согласованных скидок): ${sale.priceWithDisc}'),
      Text('Код WB: ${sale.nmId}'),
      Text('Предмет: ${sale.subject}'),
      Text('Категория: ${sale.category}'),
      Text('Бренд: ${sale.brand}'),
      Text('Стикер: ${sale.sticker}'),
      Text('Номер заказа: ${sale.gNumber}'),
    ]);
  }
}
