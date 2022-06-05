import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../constants.dart';
import '../sign_in/sign_in.dart';
import '../sign_up/sign_up_page.dart';

class WelcomePortrait extends StatelessWidget {
  const WelcomePortrait({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("WelcomePortrait");
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/girl.png",
            height: size.height * 0.5,
          ),
          SizedBox(
            height: size.width * 0.2,
          ),
          SizedBox(
            width: size.width * 0.55,
            child: Text("Какой-то умный заголовок",
                textAlign: TextAlign.center,
                style: GoogleFonts.robotoMono(
                  color: Constants.headerColor,
                  fontSize: size.width * 0.06,
                  fontWeight: FontWeight.bold,
                )),
          ),
          SizedBox(
            height: size.width * 0.08,
          ),
          SizedBox(
            width: size.width * 0.55,
            child: Text("Много какого-то текста про что-то и про то и про это",
                textAlign: TextAlign.center,
                style: GoogleFonts.robotoMono(
                  color: const Color.fromRGBO(128, 124, 142, 1),
                  fontSize: size.width * 0.03,
                  fontWeight: FontWeight.bold,
                )),
          ),
          SizedBox(
            height: size.width * 0.19,
          ),
          SizedBox(
            width: size.width * 0.8,
            child: Stack(
              children: [
                Container(
                    width: size.width * 0.4,
                    height: size.width * 0.16,
                    margin: EdgeInsets.only(
                      left: size.width * 0.36,
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromRGBO(233, 236, 247, 1),
                    ),
                    child: TextButton(
                        style: TextButton.styleFrom(
                          fixedSize: Size.fromRadius(size.width * 0.4),
                        ),
                        onPressed: () => Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return SignInPage();
                            })),
                        child: Text(Constants.signInBtnText,
                            style: GoogleFonts.robotoMono(
                              fontWeight: FontWeight.bold,
                              fontSize: size.width * 0.03,
                              color: Constants.headerColor,
                            )))),
                Container(
                    width: size.width * 0.4,
                    height: size.width * 0.16,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: TextButton(
                        style: TextButton.styleFrom(
                          fixedSize: Size.fromRadius(size.width * 0.4),
                        ),
                        onPressed: () => Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return SignUpPage();
                            })),
                        child: Text("Регистрация",
                            style: GoogleFonts.robotoMono(
                              fontWeight: FontWeight.bold,
                              fontSize: size.width * 0.03,
                              color: Constants.headerColor,
                            )))),
              ],
            ),
          )
        ],
      ),
    );
  }
}
