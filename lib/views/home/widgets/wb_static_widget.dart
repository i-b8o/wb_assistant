import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wb_api_repo/wb_api_repo.dart';
import 'package:wb_assistant/constants.dart';
import 'package:wb_assistant/presentation/custom_icons.dart';

import '../../../bloc/supplies/supplies_bloc.dart';
import 'expansion_panel_radio_body.dart';

class WbStaticWidget extends StatelessWidget {
  WbStaticWidget({
    Key? key,
    required this.supplies,
  }) : super(key: key);

  final List<Supply> supplies;
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
            ExpansionPanelList.radio(
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
                                'Дата: ${supply.dateTime.toString().replaceAll(" 00:00:00.000", "")}',
                                style: TextStyle(
                                  fontSize: size.height * 0.02,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Номер: ${supply.id}',
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
                    .toList()),
          ],
        )));
      }),
    );
  }
}

class WbStaticListView extends StatelessWidget {
  const WbStaticListView({
    Key? key,
    required this.apiList,
  }) : super(key: key);

  final List<String> apiList;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: apiList.length,
      itemBuilder: (context, index) {
        return Stack(children: [
          Container(
            margin: EdgeInsets.only(right: size.width * 0.02),
            width: size.width * 0.3,
            height: size.width * 0.3,
            color: Colors.transparent,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: size.width * 0.24,
              height: size.width * 0.24,
              margin: EdgeInsets.only(left: size.width * 0.05),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(227, 229, 241, 1),
                    blurRadius: 4.0,
                    offset: Offset(1.0, 5.0),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    Custom.warehouse,
                    color: Color.fromRGBO(252, 121, 65, 1),
                  ),
                  Text(
                    apiList[index],
                    style:
                        const TextStyle(color: Color.fromRGBO(53, 72, 138, 1)),
                  ),
                ],
              ),
            ),
          ),
        ]);
      },
    );
  }
}
