import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants.dart';

class SignUpThickPortraitHeader extends StatelessWidget {
  const SignUpThickPortraitHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return SizedBox(
      width: _size.width,
      height: _size.height * 0.3,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(Constants.signUpHeaderText,
                textAlign: TextAlign.center,
                style: GoogleFonts.robotoMono(
                  color: const Color.fromRGBO(55, 48, 74, 1),
                  fontSize: _size.width * 0.03,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(
              height: _size.width * 0.01,
            ),
            Text(Constants.signUpGreetingText,
                textAlign: TextAlign.center,
                style: GoogleFonts.robotoMono(
                  color: const Color.fromRGBO(128, 124, 142, 1),
                  fontSize: _size.width * 0.02,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(
              height: _size.width * 0.12,
            ),
          ]),
    );
  }
}
