import 'package:flutter/material.dart';

import '../../../helpers/custom_icons.dart';

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
