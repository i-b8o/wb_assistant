import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants.dart';

class SignUpThickPortraitHeader extends StatelessWidget {
  const SignUpThickPortraitHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height * 0.3,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(Constants.signUpHeaderText,
                textAlign: TextAlign.center,
                style: GoogleFonts.robotoMono(
                  color: const Color.fromRGBO(55, 48, 74, 1),
                  fontSize: size.width * 0.05,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(
              height: size.width * 0.04,
            ),
            Text(Constants.signUpGreetingText,
                textAlign: TextAlign.center,
                style: GoogleFonts.robotoMono(
                  color: const Color.fromRGBO(128, 124, 142, 1),
                  fontSize: size.width * 0.03,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(
              height: size.width * 0.10,
            ),
          ]),
    );
  }
}
