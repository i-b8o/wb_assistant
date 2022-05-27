import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components.dart';

class WelcomeBtns extends StatelessWidget {
  const WelcomeBtns({
    Key? key,
    required this.btnText,
    this.signIn = true,
    this.mobile = true,
    this.onPressed = _defaultFunction,
    this.recoverOnPressed = _defaultFunction,
  }) : super(key: key);
  final VoidCallback onPressed, recoverOnPressed;
  static _defaultFunction() {}

  final bool signIn, mobile;
  final String btnText;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        signIn
            ? SizedBox(
                width: mobile ? width * 0.92 : width * 0.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          right: mobile ? width * 0.07 : width * 0.11),
                      child: TextButton(
                        onPressed: recoverOnPressed,
                        child: Text(
                          "Восстановление пароля",
                          style: GoogleFonts.robotoMono(
                            fontWeight: FontWeight.bold,
                            fontSize: mobile ? width * 0.03 : width * 0.01,
                            color: const Color.fromRGBO(128, 124, 142, 1),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Container(),
        SizedBox(
          height: width * 0.03,
        ),
        RoundedButton(
          height: mobile ? width * 0.15 : width * 0.05,
          width: mobile ? width * 0.85 : width * 0.3,
          text: btnText,
          press: onPressed,
        ),
      ],
    );
  }
}
