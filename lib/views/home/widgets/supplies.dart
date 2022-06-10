import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wb_api_repo/wb_api_repo.dart';

import '../../../bloc/supplies/supplies_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class Supplies extends StatelessWidget {
  Supplies({
    Key? key,
    required this.supplies,
  }) : super(key: key);

  final List<Supply> supplies;
  final Uri url = Uri.parse(
      'https://docs.flutter.io/flutter/services/UrlLauncher-class.html');
  void _launchUrl() async {
    if (!await launchUrl(url)) throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => SuppliesBloc(),
      child: BlocBuilder<SuppliesBloc, SuppliesState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: ExpansionPanelList.radio(
              children: supplies
                  .map((supply) => ExpansionPanelRadio(
                      canTapOnHeader: true,
                      value: supply.id,
                      headerBuilder: (context, isExpanded) => ListTile(
                            title: Text('Номер: ${supply.id}'),
                            subtitle: Column(
                              children: [
                                Text('Дата: ${supply.dateTime}'),
                                Text('Склад: ${supply.warehouseName}'),
                              ],
                            ),
                          ),
                      body: Column(
                        children: supply.items
                            .map((item) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Image.network(
                                        item.img,
                                        width: size.width * 0.3,
                                      ),
                                      Column(
                                        children: [
                                          Text(item.article),
                                          Text(item.barCode),
                                          Text(item.status),
                                          Text(item.techSize),
                                          InkWell(
                                              child: Text(item.id.toString()),
                                              onTap: () {
                                                _launchUrl();
                                              }),
                                          Text(item.quantity.toString()),
                                          Text(item.totalPrice.toString()),
                                        ],
                                      )
                                    ],
                                  ),
                                ))
                            .toList(),
                      )))
                  .toList(),
            ),
          );
        },
      ),
    );
    // return Container(
    //     child: ListView(
    //   children: supplies
    //       .map((e) => Container(
    //             decoration:
    //                 BoxDecoration(border: Border.all(color: Colors.blueAccent)),
    //             child: Column(
    //               children: [
    //                 Container(
    //                     width: size.width * 0.5,
    //                     child: Text(
    //                       'Номер поставки ${e.id.toString()}',
    //                       style: TextStyle(color: Colors.green),
    //                     )),
    //                 Container(
    //                     width: size.width * 0.5, child: Text(e.warehouseName)),
    //                 Container(
    //                     width: size.width * 0.5,
    //                     child: Text(e.dateTime.toString())),
    //                 Container(
    //                     width: size.width * 0.5,
    //                     child: Column(
    //                       children: e.items
    //                           .map((item) => Container(
    //                                 child: Column(children: [
    //                                   Image.network(item.img),
    //                                   Text(item.article),
    //                                   Text(item.barCode),
    //                                   Text(item.status),
    //                                   Text(item.techSize),
    //                                   Text(item.id.toString()),
    //                                   Text(item.quantity.toString()),
    //                                   Text(item.totalPrice.toString()),
    //                                 ]),
    //                               ))
    //                           .toList(),
    //                     )),
    //               ],
    //             ),
    //           ))
    //       .toList(),
    // ));
  }
}

class asda extends StatelessWidget {
  const asda({
    Key? key,
    required this.supplies,
  }) : super(key: key);

  final List<Supply> supplies;

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList.radio(
      elevation: 3,
      expansionCallback: (index, isExpanded) {
        log('Expanded: $index - ');
      },
      animationDuration: Duration(milliseconds: 1),
      children: supplies
          .map((supply) => ExpansionPanel(
              headerBuilder: (_, isExpanded) => Container(
                    child: Column(children: [
                      Text('Номер поставки ${supply.id}'),
                      Text('Дата поставки ${supply.dateTime}'),
                      Text('Место поставки ${supply.warehouseName}'),
                    ]),
                  ),
              body: Column(
                children: supply.items
                    .map((item) => Column(
                          children: [
                            Text('Артикул ${item.article}'),
                            Text('Штрихкод ${item.barCode}'),
                            Row(
                              children: [
                                Image.network(item.img),
                                Text('Принято: ${item.quantity.toString()}'),
                              ],
                            ),
                          ],
                        ))
                    .toList(),
              )))
          .toList(),
    );
  }
}
