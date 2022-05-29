import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wb_assistant/views/components/btn_landscape.dart';
import 'package:wb_assistant/views/components/email_text_field_landscape.dart';
import 'package:wb_assistant/views/components/header_landscape.dart';
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
    bool shrinked = MediaQuery.of(context).size.aspectRatio > 5;
    bool keyboard = MediaQuery.of(context).viewInsets.bottom > 0.0;

    Size size = MediaQuery.of(context).size;
    return BodyLarge(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: size.width * 0.5,
            height:
                shrinked || keyboard ? size.height * 0.1 : size.height * 0.2,
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
                        fontSize: size.height * 0.02),
                  ),
                  TextButton(
                    onPressed: () => Get.to(() => const SignUpPage(),
                        transition: Transition.fadeIn),
                    child: Text(Constants.toReg,
                        style: TextStyle(
                            color: const Color.fromRGBO(54, 133, 240, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: size.height * 0.02)),
                  )
                ],
              ),
            ),
          ),
          shrinked || keyboard
              ? Container()
              : const HeaderLandscape(
                  headerText: Constants.signInHeaderText,
                  greetingText: Constants.signInGreetingText),
          TextFieldsWidget(
            fields: [
              const EmailTextFieldLandscape(),
              shrinked
                  ? Container()
                  : SizedBox(
                      height: size.height * 0.01,
                    ),
              const PasswordTextFieldLandscape(),
            ],
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          SizedBox(
            width: size.width * 0.5,
            child: keyboard
                ? SizedBox(
                    height: size.height * 0.02,
                  )
                : SizedBox(
                    height: size.height * 0.02,
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
                                fontSize: shrinked
                                    ? size.height * 0.005
                                    : size.height * 0.015,
                                color: const Color.fromRGBO(128, 124, 142, 1),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
          shrinked || keyboard
              ? Container()
              : SizedBox(
                  height: size.height * 0.05,
                ),
          BtnLandscape(
            text: Constants.signInBtnText,
            press: () =>
                Get.find<AuthenticationController>().onSignInBtnPressed(),
          ),
        ],
      ),
    );
  }
}
