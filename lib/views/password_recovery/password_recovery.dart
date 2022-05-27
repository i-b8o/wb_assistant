import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants.dart';
import '../../controllers/authentication_controller.dart';
import '../components/rounded_input_field.dart';
import '../sign_in/sign_in.dart';

class PasswordRecoveryPage extends StatelessWidget {
  const PasswordRecoveryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print("PasswordRecoveryPage");
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: GestureDetector(
          onTap: () => Get.to(() => const SignInPage()),
          child: Row(children: [
            Icon(
              Icons.keyboard_backspace,
              color: Colors.black,
              size: size.width * 0.05,
            ),
            const SizedBox(
              width: 3,
            ),
            Text(
              "Назад",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: size.width * 0.03,
                  fontWeight: FontWeight.bold),
            )
          ]),
        ),
      ),
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.12,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
                child: Text(
                  Constants.resetPasswordHeader,
                  style: TextStyle(
                      color: Constants.azureColor,
                      fontWeight: FontWeight.bold,
                      fontSize: size.height * 0.03),
                ),
              ),
              SizedBox(
                height: size.height * 0.025,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
                child: Text(
                  Constants.resetPasswordText,
                  style: TextStyle(
                      color: Constants.azureColor,
                      fontSize: size.height * 0.02),
                ),
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
            ],
          ),
          GetBuilder<AuthenticationController>(builder: (controller) {
            return Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: size.width * 0.85,
                  height: size.height * 0.05,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(color: Constants.recoverPasswordBGColor)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.025,
                      vertical: size.width * 0.0345,
                    ),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        controller.email = value;
                      },
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                          hintText: Constants.emailInputText,
                          hintStyle: TextStyle(
                            fontSize: size.height * 0.045,
                          ),
                          border: InputBorder.none),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                SizedBox(
                  width: size.width * 0.85,
                  height: size.height * 0.05,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                        color: Constants.recoverPasswordBtnColor,
                        child: TextButton(
                            onPressed: () {
                              // controller.onResendBtnPressed();
                              print("Button pressed");
                            },
                            child: Text(Constants.confirmBtnText,
                                style: GoogleFonts.robotoMono(
                                  fontSize: size.height * 0.02,
                                  color: Colors.white,
                                )))),
                  ),
                ),
              ],
            );
          }),
          SizedBox(
            height: size.height * 0.03,
          ),
        ],
      ),
    );
  }
}
