import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../controllers/authentication_controller.dart';
import '../../controllers/rounded_password_field_obscure_controller.dart';

class PasswordTextFieldThickPortrait extends StatelessWidget {
  const PasswordTextFieldThickPortrait({Key? key}) : super(key: key);

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
