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
    // double width = MediaQuery.of(context).size.width;

    return TextFieldConainer(
      bottomPadding: mobile ? width * 0.04 : width * 0.015,
      height: height,
      width: width,
      child: GetX<RoundedPasswordFieldObscureController>(
        init: RoundedPasswordFieldObscureController(),
        initState: (_) {},
        builder: (controller) {
          return TextField(
            onChanged: onChanged,
            obscureText: controller.obscure.isFalse,
            style: TextStyle(fontSize: height * 0.25),
            decoration: InputDecoration(
                hintText: "Пароль",
                hintStyle: TextStyle(fontSize: height * 0.25),
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
          );
        },
      ),
    );
  }
}
