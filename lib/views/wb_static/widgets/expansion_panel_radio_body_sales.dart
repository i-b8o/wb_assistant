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
      Text('Штрихкод: ${sale.barcode}'),
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
