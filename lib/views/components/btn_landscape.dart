import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants.dart';

class BtnLandscape extends StatelessWidget {
  const BtnLandscape({Key? key, this.press, required this.text})
      : super(key: key);
  final void Function()? press;
  final String text;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.30,
      height: size.height * 0.08,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: Constants.btnColor,
          child: TextButton(
              onPressed: press,
              child: Text(text,
                  style: GoogleFonts.robotoMono(
                    fontWeight: FontWeight.bold,
                    fontSize: size.height * 0.02,
                    color: Colors.white,
                  ))),
        ),
      ),
    );
  }
}
