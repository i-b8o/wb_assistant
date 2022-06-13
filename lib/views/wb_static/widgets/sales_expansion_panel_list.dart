import 'package:flutter/material.dart';
import 'package:wb_api_repo/wb_api_repo.dart';
import 'package:wb_assistant/views/wb_static/widgets/expansion_panel_radio_body_orders.dart';

import 'expansion_panel_radio_body_sales.dart';

class SalesExpansionPanelList extends StatelessWidget {
  const SalesExpansionPanelList({
    Key? key,
    required this.sales,
  }) : super(key: key);

  final List<Sale> sales;

  @override
  Widget build(BuildContext context) {
    int i = 0;
    Size size = MediaQuery.of(context).size;
    return ExpansionPanelList.radio(
        elevation: 0,
        children: sales
            .map((sale) => ExpansionPanelRadio(
                  backgroundColor: Colors.transparent,
                  canTapOnHeader: true,
                  value: i++,
                  headerBuilder: (context, isExpanded) => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        sale.img,
                        width: size.width * 0.28,
                        height: size.width * 0.28,
                      ),
                      Column(
                        children: [
                          Text('Кол-во: ${sale.lastChangeDate}'),
                          Text(
                            'Склад: ${sale.warehouseName}',
                            style: TextStyle(
                              fontSize: size.height * 0.02,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          sale.isRealization
                              ? Container(
                                  width: size.width * 0.2,
                                  height: size.width * 0.05,
                                  color: Colors.green,
                                )
                              : Container(),
                        ],
                      ),
                    ],
                  ),
                  body: ExpansionPanelRadioBodySales(
                    sale: sale,
                  ),
                ))
            .toList());
  }
}
