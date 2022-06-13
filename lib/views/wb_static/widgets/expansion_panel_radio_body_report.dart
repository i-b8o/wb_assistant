import 'package:flutter/material.dart';
import 'package:wb_api_repo/wb_api_repo.dart';

class ExpansionPanelRadioBodyReport extends StatelessWidget {
  const ExpansionPanelRadioBodyReport({Key? key, required this.report})
      : super(key: key);
  final Report report;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Text('Штрихкод: ${report.barcode}'),
      Text('Бренд: ${report.brandName}'),
      Text(report.supplier_oper_name),
      Text(report.barcode),
      Text(report.doc_type_name),
      Text('${report.delivery_amount}'),
      Text(report.order_dt),
      Text(report.gi_box_type_name),
      Text(report.saName),
      Text(report.ppvz_inn),
      Text('${report.ppvz_sales_commission}'),
      Text('Кол-во: ${report.quantity}'),
      Text('${report.nmId}'),
    ]);
  }
}
