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
      Text('${stock.barcode}'),
      Text(stock.brand),
      Text(stock.category),
      Text('${stock.daysOnSite}'),
      Text('${stock.discount}'),
      Text('${stock.inWayFromClient}'),
      Text('${stock.inWayToClient}'),
      Text('${stock.isRealization}'),
      Text('${stock.isSupply}'),
      Text(stock.lastChangeDate),
      Text('${stock.price}'),
    ]);
  }
}
