import 'package:flutter/material.dart';

class TextFieldsWidget extends StatelessWidget {
  const TextFieldsWidget({
    Key? key,
    required this.fields,
  }) : super(key: key);

  final List<Widget> fields;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: fields
          .map(
            (e) => e,
          )
          .toList(),
    );
  }
}
