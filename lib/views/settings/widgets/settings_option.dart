import 'package:flutter/material.dart';

import '../../../constants.dart';

class SettingsOption extends StatelessWidget {
  const SettingsOption({
    Key? key,
    required this.text,
    required this.icon,
    required this.onTap,
  }) : super(key: key);
  final String text;
  final IconData icon;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: size.height * 0.03,
                color: Constants.headerColor,
              ),
              SizedBox(
                width: size.width * 0.04,
              ),
              Text(
                text,
                style: TextStyle(
                    fontSize: size.height * 0.02, color: Constants.headerColor),
              ),
            ],
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: Constants.greyColor,
          )
        ],
      ),
    );
  }
}
