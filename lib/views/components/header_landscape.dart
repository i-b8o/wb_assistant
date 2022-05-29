import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderLandscape extends StatelessWidget {
  const HeaderLandscape(
      {Key? key, required this.headerText, required this.greetingText})
      : super(key: key);
  final String headerText, greetingText;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.5,
      height: size.height * 0.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(headerText,
              textAlign: TextAlign.center,
              style: GoogleFonts.robotoMono(
                color: const Color.fromRGBO(55, 48, 74, 1),
                fontSize: size.height * 0.035,
                fontWeight: FontWeight.bold,
              )),
          SizedBox(
            height: size.height * 0.025,
          ),
          Text(greetingText,
              textAlign: TextAlign.center,
              style: GoogleFonts.robotoMono(
                color: const Color.fromRGBO(128, 124, 142, 1),
                fontSize: size.height * 0.02,
              )),
          SizedBox(
            height: size.height * 0.05,
          )
        ],
      ),
    );
  }
}
