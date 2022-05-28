import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants.dart';

class ResetPasswordBtn extends StatelessWidget {
  const ResetPasswordBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * 0.85,
      height: size.height * 0.07,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
            color: Constants.recoverPasswordBtnColor,
            child: TextButton(
                onPressed: () {
                  // controller.onResendBtnPressed();
                  print("Button pressed");
                },
                child: Text(Constants.resetPasswordBtnText,
                    style: GoogleFonts.robotoMono(
                      fontSize: size.height * 0.02,
                      color: Colors.white,
                    )))),
      ),
    );
  }
}
