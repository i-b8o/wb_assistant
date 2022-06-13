import 'package:flutter/material.dart';
import 'package:wb_api_repo/wb_api_repo.dart';
import 'package:wb_assistant/views/wb_static/widgets/expansion_panel_radio_body_stocks.dart';

import 'expansion_panel_radio_body.dart';

class StocksExpansionPanelList extends StatelessWidget {
  const StocksExpansionPanelList({
    Key? key,
    required this.stocks,
  }) : super(key: key);

  final List<Stock> stocks;

  @override
  Widget build(BuildContext context) {
    int i = 0;
    Size size = MediaQuery.of(context).size;
    return ExpansionPanelList.radio(
        elevation: 0,
        children: stocks
            .map((stock) => ExpansionPanelRadio(
                  backgroundColor: Colors.transparent,
                  canTapOnHeader: true,
                  value: i++,
                  headerBuilder: (context, isExpanded) => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        stock.img,
                        width: size.width * 0.28,
                        height: size.width * 0.28,
                      ),
                      Column(
                        children: [
                          Text('Кол-во: ${stock.quantity}'),
                          Text(
                            'Склад: ${stock.warehouseName}',
                            style: TextStyle(
                              fontSize: size.height * 0.02,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  body: ExpansionPanelRadioBodyStocks(
                    stock: stock,
                  ),
                ))
            .toList());
  }
}
