import 'package:flutter/material.dart';

import 'components.dart';

// TODO TextFields text so small and alignment is not correct
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
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    print(queryData.devicePixelRatio);

    return TextFieldConainer(
        bottomPadding: mobile ? width * 0.04 : width * 0.015,
        height: height,
        width: width,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.03,
            vertical: height * 0.23,
          ),
          child: TextField(
            keyboardType:
                email ? TextInputType.emailAddress : TextInputType.name,
            onChanged: onChanged,
            style: TextStyle(
              fontSize: height * 0.3,
            ),
            textAlignVertical: TextAlignVertical.center,
            decoration:
                InputDecoration(hintText: hintText, border: InputBorder.none),
          ),
        ));
  }
}
