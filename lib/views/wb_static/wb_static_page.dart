import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wb_assistant/constants.dart';

import '../../bloc/supplies/supplies_bloc.dart';
import 'widgets/wb_static_list_view.dart';

class WbStaticPage extends StatelessWidget {
  WbStaticPage({
    Key? key,
    required this.apiKey,
  }) : super(key: key);

  final String apiKey;
  final List<String> apiList = [
    'Поставки',
    'Склад',
    'Заказы',
    'Продажи',
    'КиЗы'
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => SuppliesBloc(),
      child:
          BlocBuilder<SuppliesBloc, SuppliesState>(builder: (context, state) {
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
            SizedBox(
              height: size.width * 0.3,
              child: WbStaticListView(apiList: apiList),
              // child: Container(),
            ),
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
            // ExpansionPanelList.radio(
            //     elevation: 0,
            //     children: supplies
            //         .map((supply) => ExpansionPanelRadio(
            //               backgroundColor: Colors.transparent,
            //               canTapOnHeader: true,
            //               value: supply.id,
            //               headerBuilder: (context, isExpanded) => Column(
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   Text(
            //                     'Дата: ${supply.dateTime.toString().replaceAll(" 00:00:00.000", "")}',
            //                     style: TextStyle(
            //                       fontSize: size.height * 0.02,
            //                       fontWeight: FontWeight.bold,
            //                     ),
            //                   ),
            //                   Text(
            //                     'Номер: ${supply.id}',
            //                     style: TextStyle(
            //                       fontSize: size.height * 0.02,
            //                       fontWeight: FontWeight.bold,
            //                     ),
            //                   ),
            //                   Text(
            //                     'Склад: ${supply.warehouseName}',
            //                     style: TextStyle(
            //                       fontSize: size.height * 0.02,
            //                       fontWeight: FontWeight.bold,
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //               body: ExpansionPanelRadioBody(
            //                 supply: supply,
            //               ),
            //             ))
            //         .toList()),
          ],
        )));
      }),
    );
  }
}
