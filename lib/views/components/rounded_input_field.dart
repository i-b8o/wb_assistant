import 'package:flutter/material.dart';

import 'components.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  final double height, width;
  final bool email, mobile;
  const RoundedInputField({
    Key? key,
    required this.hintText,
    required this.onChanged,
    required this.height,
    required this.width,
    this.email = true,
    this.mobile = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return TextFieldConainer(
        bottomPadding: mobile ? _width * 0.04 : _width * 0.015,
        height: height,
        width: width,
        child: TextField(
          keyboardType: email ? TextInputType.emailAddress : TextInputType.name,
          onChanged: onChanged,
          style: TextStyle(fontSize: height * 0.25),
          decoration:
              InputDecoration(hintText: hintText, border: InputBorder.none),
        ));
  }
}
