import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants.dart';

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
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: mobile ? width : width * 0.5,
      height: mobile ? width * 0.6 : width * 0.14,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(headerText,
              textAlign: TextAlign.center,
              style: GoogleFonts.robotoMono(
                color: Constants.headerColor,
                fontSize: mobile ? width * 0.06 : width * 0.02,
                fontWeight: FontWeight.bold,
              )),
          SizedBox(
            height: width * 0.01,
          ),
          Text(greetingText,
              textAlign: TextAlign.center,
              style: GoogleFonts.robotoMono(
                color: const Color.fromRGBO(128, 124, 142, 1),
                fontSize: mobile ? width * 0.05 : width * 0.01,
              )),
          SizedBox(
            height: mobile ? width * 0.12 : width * 0.03,
          )
        ],
      ),
    );
  }
}
