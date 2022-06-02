import 'package:flutter/material.dart';

import '../../../../constants.dart';

class NameTextFieldLandscape extends StatelessWidget {
  const NameTextFieldLandscape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.30,
      height: size.height * 0.08,
      child: TextField(
        style: TextStyle(fontSize: size.height * 0.02),
        textAlignVertical: TextAlignVertical.center,
        onChanged: (value) {},
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white, width: 2.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white, width: 2.0),
          ),
          hintText: Constants.nameInputText,
          contentPadding: EdgeInsets.symmetric(
            vertical: size.height * 0.03,
            horizontal: size.width * 0.01,
          ),
        ),
      ),
    );
  }
}
