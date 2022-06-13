import 'package:flutter/material.dart';
import 'package:wb_api_repo/wb_api_repo.dart';
import 'package:wb_assistant/views/wb_static/widgets/expansion_panel_radio_body_orders.dart';

import 'expansion_panel_radio_body_report.dart';

class ReportExpansionPanelList extends StatelessWidget {
  const ReportExpansionPanelList({
    Key? key,
    required this.reports,
  }) : super(key: key);

  final List<Report> reports;

  @override
  Widget build(BuildContext context) {
    int i = 0;
    Size size = MediaQuery.of(context).size;
    return ExpansionPanelList.radio(
        elevation: 0,
        children: reports
            .map((report) => ExpansionPanelRadio(
                  backgroundColor: Colors.transparent,
                  canTapOnHeader: true,
                  value: i++,
                  headerBuilder: (context, isExpanded) => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        report.img,
                        width: size.width * 0.28,
                        height: size.width * 0.28,
                      ),
                      Column(
                        children: [
                          Text('Кол-во: ${report.quantity}'),
                          Text(
                            'Офис: ${report.brandName}',
                            style: TextStyle(
                              fontSize: size.height * 0.02,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  body: ExpansionPanelRadioBodyReport(
                    report: report,
                  ),
                ))
            .toList());
  }
}
