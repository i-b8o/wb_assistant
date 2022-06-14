import 'package:flutter/material.dart';
import 'package:wb_api_repo/wb_api_repo.dart';

import 'expansion_panel_radio_body.dart';

class IncomesExpansionPanelList extends StatelessWidget {
  const IncomesExpansionPanelList({
    Key? key,
    required this.supplies,
  }) : super(key: key);

  final List<Supply> supplies;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ExpansionPanelList.radio(
        elevation: 0,
        children: supplies
            .map((supply) => ExpansionPanelRadio(
                  backgroundColor: Colors.transparent,
                  canTapOnHeader: true,
                  value: supply.id,
                  headerBuilder: (context, isExpanded) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Дата поступления: ${supply.dateTime.toString().replaceAll(" 00:00:00.000", "")}',
                        style: TextStyle(
                          fontSize: size.height * 0.02,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Номер поставки: ${supply.id}',
                        style: TextStyle(
                          fontSize: size.height * 0.02,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Склад: ${supply.warehouseName}',
                        style: TextStyle(
                          fontSize: size.height * 0.02,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  body: ExpansionPanelRadioBody(
                    supply: supply,
                  ),
                ))
            .toList());
  }
}
