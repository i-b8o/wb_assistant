import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants.dart';

import '../sign_in/sign_in.dart';
import '../sign_up/sign_up_page.dart';

class WelcomeThickPortrait extends StatelessWidget {
  const WelcomeThickPortrait({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            height: size.height * 0.1,
          ),
          SizedBox(
            width: size.width * 0.55,
            child: Text("Какой-то очень умный заголовок",
                textAlign: TextAlign.center,
                style: GoogleFonts.robotoMono(
                  color: const Color.fromRGBO(55, 48, 74, 1),
                  fontSize: size.height * 0.04,
                  fontWeight: FontWeight.bold,
                )),
          ),
          SizedBox(
            height: size.width * 0.03,
          ),
          SizedBox(
            width: size.width * 0.55,
            child: Text("Много какого-то текста про что-то и про то и про это",
                textAlign: TextAlign.center,
                style: GoogleFonts.robotoMono(
                  color: const Color.fromRGBO(128, 124, 142, 1),
                  fontSize: size.width * 0.02,
                  fontWeight: FontWeight.bold,
                )),
          ),
          SizedBox(
            height: size.width * 0.09,
          ),
          SizedBox(
            width: size.width * 0.8,
            child: Stack(
              children: [
                Container(
                    width: size.width * 0.46,
                    height: size.height * 0.08,
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
                        onPressed: () => Get.to(() => const SignInPage()),
                        child: Text(Constants.logBtnText,
                            style: GoogleFonts.robotoMono(
                              fontWeight: FontWeight.bold,
                              fontSize: size.width * 0.03,
                              color: const Color.fromRGBO(55, 48, 74, 1),
                            )))),
                Container(
                    width: size.width * 0.4,
                    height: size.height * 0.08,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: TextButton(
                        style: TextButton.styleFrom(
                          fixedSize: Size.fromRadius(size.width * 0.4),
                        ),
                        onPressed: () => Get.to(() => const SignUpPage()),
                        child: Text("Регистрация",
                            style: GoogleFonts.robotoMono(
                              fontWeight: FontWeight.bold,
                              fontSize: size.width * 0.03,
                              color: const Color.fromRGBO(55, 48, 74, 1),
                            )))),
              ],
            ),
          )
        ],
      ),
    );
  }
}
