import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wb_api_repo/wb_api_repo.dart';
import 'package:wb_assistant/constants.dart';

import '../../../bloc/supplies/supplies_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class Supplies extends StatelessWidget {
  Supplies({
    Key? key,
    required this.supplies,
  }) : super(key: key);

  final List<Supply> supplies;
  void _launchUrl(String id) async {
    final Uri url =
        Uri.parse('https://www.wildberries.ru/catalog/$id/detail.aspx');
    if (!await launchUrl(url)) throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => SuppliesBloc(),
      child: BlocBuilder<SuppliesBloc, SuppliesState>(
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              child: ExpansionPanelList.radio(
                elevation: 0,
                children: supplies
                    .map((supply) => ExpansionPanelRadio(
                        canTapOnHeader: true,
                        value: supply.id,
                        headerBuilder: (context, isExpanded) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Номер: ${supply.id}'),
                                Text(
                                    'Дата: ${supply.dateTime.toString().replaceAll(" 00:00:00.000", "")}'),
                                Text('Склад: ${supply.warehouseName}'),
                              ],
                            ),
                        body: Column(
                          children: supply.items
                              .map((item) => Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Constants.greyColor),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20))),
                                    margin: EdgeInsets.only(
                                        top: size.height * 0.01),
                                    width: size.width * 09,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Image.network(
                                            item.img,
                                            width: size.width * 0.28,
                                            height: size.width * 0.28,
                                          ),
                                          Column(
                                            children: [
                                              Text(item.article),
                                              Text(item.barCode),
                                              Text(item.status),
                                              InkWell(
                                                  child:
                                                      Text(item.id.toString()),
                                                  onTap: () {
                                                    _launchUrl(
                                                        item.id.toString());
                                                  }),
                                              Text(item.quantity.toString()),
                                              Text(item.totalPrice.toString()),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ))
                              .toList(),
                        )))
                    .toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
