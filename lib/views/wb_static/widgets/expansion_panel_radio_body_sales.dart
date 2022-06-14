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
      Text('Бренд: ${sale.brand}'),
      Text(sale.category),
      Text(sale.barcode),
      Text(sale.category),
      Text(sale.date),
      Text('${sale.discountPercent}'),
      Text(sale.gNumber),
      Text(sale.lastChangeDate),
      Text('${sale.incomeID}'),
      Text(sale.lastChangeDate),
      Text('${sale.nmId}'),
    ]);
  }
}
