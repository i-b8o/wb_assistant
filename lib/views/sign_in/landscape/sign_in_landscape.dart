import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wb_assistant/views/components/btn_landscape.dart';
import 'package:wb_assistant/views/components/email_text_field_landscape.dart';
import 'package:wb_assistant/views/components/password_text_field_landscape.dart';
import 'package:wb_assistant/views/password_recovery/password_recovery.dart';

import '../../../constants.dart';
import '../../../controllers/authentication_controller.dart';
import '../../components/body_large.dart';
import '../../components/welcome_text_fields.dart';
import '../../sign_up/sign_up_page.dart';

// Fields looks bad
class SignInLandscape extends StatelessWidget {
  const SignInLandscape({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('SignInLandscape');
    Size size = MediaQuery.of(context).size;
    return BodyLarge(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width * 0.5,
              height: size.height * 0.2,
              child: Padding(
                padding: EdgeInsets.only(right: size.width * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      Constants.noAccountYetText,
                      style: TextStyle(
                          color: const Color.fromRGBO(61, 57, 74, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * 0.01),
                    ),
                    TextButton(
                      onPressed: () => Get.to(() => const SignUpPage(),
                          transition: Transition.fadeIn),
                      child: Text(Constants.toReg,
                          style: TextStyle(
                              color: const Color.fromRGBO(54, 133, 240, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: size.width * 0.01)),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: size.width * 0.5,
              height: size.height * 0.14,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(Constants.signInHeaderText,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.robotoMono(
                        color: const Color.fromRGBO(55, 48, 74, 1),
                        fontSize: size.width * 0.03,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    height: size.width * 0.01,
                  ),
                  Text(Constants.signInGreetingText,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.robotoMono(
                        color: const Color.fromRGBO(128, 124, 142, 1),
                        fontSize: size.width * 0.015,
                      )),
                  SizedBox(
                    height: size.width * 0.03,
                  )
                ],
              ),
            ),
            TextFieldsWidget(
              fields: [
                const EmailTextFieldLandscape(),
                SizedBox(
                  height: size.height * 0.01,
                ),
                const PasswordTextFieldLandscape(),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: size.width * 0.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: size.width * 0.11),
                        child: TextButton(
                          onPressed: () => Get.to(
                              () => const PasswordRecoveryPage(),
                              transition: Transition.fadeIn),
                          child: Text(
                            Constants.passRecText,
                            style: GoogleFonts.robotoMono(
                              fontWeight: FontWeight.bold,
                              fontSize: size.width * 0.01,
                              color: const Color.fromRGBO(128, 124, 142, 1),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.width * 0.03,
                ),
                BtnLandscape(
                  text: Constants.signInBtnText,
                  press: () =>
                      Get.find<AuthenticationController>().onSignInBtnPressed(),
                )
                // RoundedButton(
                //   height: size.width * 0.05,
                //   width: size.width * 0.3,
                //   text: Constants.signInBtnText,
                //   press: () =>
                //       Get.find<AuthenticationController>().onSignInBtnPressed(),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
