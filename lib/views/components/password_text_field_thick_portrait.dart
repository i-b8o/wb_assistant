import 'package:flutter/material.dart';

import '../../constants.dart';

class PasswordTextFieldThickPortrait extends StatelessWidget {
  const PasswordTextFieldThickPortrait({Key? key, required this.controller})
      : super(key: key);
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.85,
      height: size.height * 0.08,
      child: TextField(
        obscureText: false,
        style: TextStyle(fontSize: size.height * 0.02),
        textAlignVertical: TextAlignVertical.center,
        controller: controller,
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
            hintText: Constants.passInputText,
            contentPadding: EdgeInsets.symmetric(
              vertical: size.height * 0.03,
              horizontal: size.width * 0.04,
            ),
            suffixIcon: InkWell(
              onTap: () {},
              child: Icon(
                true
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: Constants.greyColor,
                size: size.height * 0.03,
              ),
            )),
      ),
    );
  }
}
