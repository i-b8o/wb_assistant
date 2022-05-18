import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeHeader extends StatelessWidget {
  const WelcomeHeader({
    Key? key,
    required this.headerText,
    required this.greetingText,
    this.mobile = true,
  }) : super(key: key);

  final String headerText, greetingText;
  final bool mobile;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: mobile ? _width : _width * 0.5,
      height: mobile ? _width * 0.6 : _width * 0.14,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(headerText,
              textAlign: TextAlign.center,
              style: GoogleFonts.robotoMono(
                color: const Color.fromRGBO(55, 48, 74, 1),
                fontSize: mobile ? _width * 0.06 : _width * 0.02,
                fontWeight: FontWeight.bold,
              )),
          SizedBox(
            height: _width * 0.01,
          ),
          Text(greetingText,
              textAlign: TextAlign.center,
              style: GoogleFonts.robotoMono(
                color: const Color.fromRGBO(128, 124, 142, 1),
                fontSize: mobile ? _width * 0.05 : _width * 0.01,
              )),
          SizedBox(
            height: mobile ? _width * 0.12 : _width * 0.03,
          )
        ],
      ),
    );
  }
}
