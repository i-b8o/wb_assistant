import 'package:flutter/material.dart';
import 'package:wb_api_repo/wb_api_repo.dart';
import 'package:wb_assistant/views/wb_static/widgets/expansion_panel_radio_body_orders.dart';

class OrdersExpansionPanelList extends StatelessWidget {
  const OrdersExpansionPanelList({
    Key? key,
    required this.orders,
  }) : super(key: key);

  final List<Order> orders;

  @override
  Widget build(BuildContext context) {
    int i = 0;
    Size size = MediaQuery.of(context).size;
    return ExpansionPanelList.radio(
        elevation: 0,
        children: orders
            .map((order) => ExpansionPanelRadio(
                  backgroundColor: Colors.transparent,
                  canTapOnHeader: true,
                  value: i++,
                  headerBuilder: (context, isExpanded) => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        order.img,
                        width: size.width * 0.28,
                        height: size.width * 0.28,
                      ),
                      Column(
                        children: [
                          order.isCancel
                              ? Container(
                                  width: size.width * 0.2,
                                  height: size.width * 0.05,
                                  color: Colors.red,
                                  child: const Text("Отменён"),
                                )
                              : Container(),
                          Text(order.supplierArticle),
                          Text('Дата: ${order.date}'),
                        ],
                      ),
                    ],
                  ),
                  body: ExpansionPanelRadioBodyOrders(
                    order: order,
                  ),
                ))
            .toList());
  }
}
