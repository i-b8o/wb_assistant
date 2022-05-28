import 'package:flutter/material.dart';

import '../../../constants.dart';

class ResetPasswordDescription extends StatelessWidget {
  const ResetPasswordDescription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
          child: Text(
            Constants.resetPasswordHeader,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: size.height * 0.03),
          ),
        ),
        SizedBox(
          height: size.height * 0.025,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
          child: Text(
            Constants.resetPasswordText,
            style: TextStyle(
                // color: Constants.recoverPasswordTextColor,
                fontSize: size.height * 0.02),
          ),
        ),
        SizedBox(
          height: size.height * 0.1,
        ),
      ],
    );
  }
}
