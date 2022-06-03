import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wb_assistant/constants.dart';

class OldRoundedButton extends StatelessWidget {
  final String text;
  final void Function()? press;
  final Color color, textColor;
  const OldRoundedButton({
    Key? key,
    required this.text,
    required this.press,
    this.color = Constants.btnColor,
    this.textColor = Colors.white,
    required this.width,
    required this.height,
  }) : super(key: key);
  final double width, height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: color,
          child: TextButton(
              onPressed: () {
                press!();
              },
              child: Text(text,
                  style: GoogleFonts.robotoMono(
                    fontWeight: FontWeight.bold,
                    fontSize: height * 0.25,
                    color: textColor,
                  ))),
        ),
      ),
    );
  }
}