import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/wb_static/wbstatic_bloc.dart';
import '../../../helpers/custom_icons.dart';

class WbStaticListView extends StatelessWidget {
  const WbStaticListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.width * 0.3,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: context.read<WbstaticBloc>().apiList.length,
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
              child: GestureDetector(
                onTap: () {
                  context.read<WbstaticBloc>().tab = index;
                  context.read<WbstaticBloc>().add(ListViewItemPushedEvent());
                },
                child: ListItem(
                    text: context.read<WbstaticBloc>().apiList[index],
                    isActive: context.read<WbstaticBloc>().tab == index),
              ),
            ),
          ]);
        },
      ),
      // child: Container(),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({
    Key? key,
    required this.text,
    required this.isActive,
  }) : super(key: key);
  final String text;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
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
            text,
            style: TextStyle(
                color: Color.fromRGBO(53, 72, 138, 1),
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
