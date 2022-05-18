import 'package:flutter/material.dart';

import '../../constants.dart';

class BodyLarge extends StatelessWidget {
  const BodyLarge({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          color: Constants.pinkColor,
          width: _size.width * 0.5,
          height: _size.height,
          child: AspectRatio(
              aspectRatio: 1 / 1,
              child: Image.asset(
                "assets/images/girl.png",
              )),
        ),
        child,
      ],
    );
  }
}
