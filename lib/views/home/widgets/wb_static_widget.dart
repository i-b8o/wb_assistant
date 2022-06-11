import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wb_api_repo/wb_api_repo.dart';
import 'package:wb_assistant/constants.dart';

import '../../../bloc/supplies/supplies_bloc.dart';
import 'expansion_panel_radio_body.dart';

class WbStaticWidget extends StatelessWidget {
  const WbStaticWidget({
    Key? key,
    required this.supplies,
  }) : super(key: key);

  final List<Supply> supplies;

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
                    fontSize: size.height * 0.02, color: Constants.greyColor),
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            SizedBox(
              height: size.height * 0.1,
              child: ListView(
                // This next line does the trick.
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    width: 160.0,
                    color: Colors.red,
                  ),
                  Container(
                    width: 160.0,
                    color: Colors.blue,
                  ),
                  Container(
                    width: 160.0,
                    color: Colors.green,
                  ),
                  Container(
                    width: 160.0,
                    color: Colors.yellow,
                  ),
                  Container(
                    width: 160.0,
                    color: Colors.orange,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            ExpansionPanelList.radio(
                elevation: 0,
                children: supplies
                    .map((supply) => ExpansionPanelRadio(
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
