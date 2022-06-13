import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wb_api_repo/wb_api_repo.dart';

import '../../../constants.dart';

class ExpansionPanelRadioBodyStocksInfo extends StatelessWidget {
  const ExpansionPanelRadioBodyStocksInfo({Key? key, required this.item})
      : super(key: key);
  final SupplyItem item;

  void _launchUrl(String id) async {
    final Uri url =
        Uri.parse('https://www.wildberries.ru/catalog/$id/detail.aspx');
    if (!await launchUrl(url)) throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: size.width * 0.5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  item.article,
                  style: TextStyle(
                      fontSize: size.height * 0.015,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: size.width * 0.01,
              ),
              Container(
                alignment: Alignment.center,
                width: size.width * 0.16,
                decoration: BoxDecoration(
                    color: item.status == "Принято"
                        ? Constants.blueColor
                        : Colors.red,
                    border: Border.all(color: Constants.blueColor),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: Text(
                  item.status,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: size.height * 0.015,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: size.width * 0.5,
          child: Row(
            children: [
              Text(
                'Штрихкод ${item.barCode}',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Constants.greyColor,
                  fontSize: size.height * 0.014,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: size.width * 0.5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  child: Text(
                    'В карточку',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: size.height * 0.018,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onTap: () {
                    _launchUrl(item.id.toString());
                  }),
              Text(
                '${item.quantity.toString()} шт',
                style: const TextStyle(
                    color: Constants.blueColor, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
