import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../controllers/rounded_password_field_obscure_controller.dart';
import 'components.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
    required this.height,
    required this.width,
    this.mobile = true,
  }) : super(key: key);
  final double height, width;
  final bool mobile;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double ar = size.width / size.height;

    return TextFieldConainer(
      bottomPadding: mobile ? width * 0.04 : width * 0.015,
      height: height,
      width: width,
      child: GetX<RoundedPasswordFieldObscureController>(
        init: RoundedPasswordFieldObscureController(),
        initState: (_) {},
        builder: (controller) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.03,
              vertical: height * 0.23,
            ),
            child: TextField(
              onChanged: onChanged,
              obscureText: controller.obscure.isFalse,
              style: TextStyle(
                fontSize: ar < 1.8 ? height * 0.3 : height * 0.2,
              ),
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                  hintText: "Пароль",
                  hintStyle: TextStyle(
                    fontSize: ar < 1.8 ? height * 0.3 : height * 0.2,
                  ),
                  border: InputBorder.none,
                  suffixIcon: InkWell(
                    onTap: () {
                      controller.toggle();
                    },
                    child: Icon(
                      controller.obscure.isFalse
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Constants.greyColor,
                      size: height * 0.4,
                    ),
                  )),
            ),
          );
        },
      ),
    );
  }
}
