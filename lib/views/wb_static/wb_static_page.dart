import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wb_assistant/bloc/wb_static/wbstatic_bloc.dart';
import 'package:wb_assistant/constants.dart';
import 'package:wb_assistant/views/wb_static/widgets/sales_expansion_panel_list.dart';
import 'package:wb_assistant/views/wb_static/widgets/stocks_expansion_panel_list.dart';

import 'widgets/incomes_expansion_panel_list.dart';
import 'widgets/orders_expansion_panel_list.dart';
import 'widgets/wb_static_list_view.dart';

class WbStaticPage extends StatelessWidget {
  const WbStaticPage({
    Key? key,
    required this.apiKey,
  }) : super(key: key);

  final String apiKey;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => WbstaticBloc(),
      child:
          BlocBuilder<WbstaticBloc, WbstaticState>(builder: (context, state) {
        return SafeArea(
            child: SingleChildScrollView(
                child: Column(
          children: [
            SizedBox(
              height: size.height * 0.03,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Сервис статистики WB партнёры",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: size.height * 0.02, color: Constants.wbColor),
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            WbStaticListView(apiList: context.read<WbstaticBloc>().apiList),
            SizedBox(
              height: size.height * 0.03,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Ваши поставки",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: size.height * 0.02, color: Constants.greyColor),
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            (state is IncomesState)
                ? IncomesExpansionPanelList(supplies: state.supplies)
                : (state is StocksState)
                    ? StocksExpansionPanelList(stocks: state.stocks)
                    : (state is OrdersState)
                        ? OrdersExpansionPanelList(orders: state.orders)
                        : (state is SalesState)
                            ? SalesExpansionPanelList(sales: state.sales)
                            : Container()
          ],
        )));
      }),
    );
  }
}
