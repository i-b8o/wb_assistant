import 'package:flutter/material.dart';

class TextFieldConainer extends StatelessWidget {
  final Widget child;
  const TextFieldConainer(
      {Key? key,
      required this.child,
      required this.width,
      required this.height,
      required this.bottomPadding})
      : super(key: key);
  final double width, height, bottomPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: bottomPadding),
      alignment: Alignment.center,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
