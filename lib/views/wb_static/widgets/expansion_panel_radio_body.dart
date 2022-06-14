import 'package:flutter/material.dart';
import 'package:wb_api_repo/wb_api_repo.dart';

import '../../../constants.dart';
import 'expansion_panel_radio_body_info.dart';

class ExpansionPanelRadioBody extends StatelessWidget {
  const ExpansionPanelRadioBody({Key? key, required this.supply})
      : super(key: key);
  final Supply supply;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: supply.items
          .map((item) => Container(
                width: size.width * 0.93,
                // height: size.height * 0.15,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Constants.greyColor),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                margin: EdgeInsets.only(top: size.height * 0.01),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.02,
                      vertical: size.height * 0.01),
                  child: Row(
                    children: [
                      Image.network(
                        item.img,
                        width: size.width * 0.28,
                        height: size.width * 0.28,
                      ),
                      ExpansionPanelRadioBodyInfo(
                        item: item,
                      )
                    ],
                  ),
                ),
              ))
          .toList(),
    );
  }
}
