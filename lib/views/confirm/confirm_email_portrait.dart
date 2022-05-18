import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wb_assistant/constants.dart';
import 'package:wb_assistant/controllers/authentication_controller.dart';

class ConfirmEmailPortrait extends StatelessWidget {
  const ConfirmEmailPortrait({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: Colors.transparent,
    // ));
    Size _size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.black,
            size: _size.width * 0.1,
          ),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          Image.asset(
            "assets/images/clouds.png",
            // height: _size.height * 0.5,
          ),
          SizedBox(
            height: _size.height * 0.12,
          ),
          Text(
            Constants.ConfirmHeaderText,
            style: TextStyle(
                color: Constants.azureColor,
                fontWeight: FontWeight.bold,
                fontSize: _size.height * 0.03),
          ),
          SizedBox(
            height: _size.height * 0.025,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: _size.width * 0.07),
            child: Text(
              Constants.ConfirmGreetingText,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Constants.azureColor,
                  // fontWeight: FontWeight.bold,
                  fontSize: _size.height * 0.02),
            ),
          ),
          SizedBox(
            height: _size.height * 0.1,
          ),
          SizedBox(
            width: _size.width * 0.85,
            height: _size.height * 0.06,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(_size.width * 0.1),
              child: Container(
                color: const Color.fromRGBO(238, 94, 125, 1),
                child:
                    GetBuilder<AuthenticationController>(builder: (controller) {
                  return TextButton(
                      onPressed: () {
                        controller.resend();
                      },
                      child: Text(Constants.confirmBtnText,
                          style: GoogleFonts.robotoMono(
                            fontSize: _size.height * 0.02,
                            color: Colors.white,
                          )));
                }),
              ),
            ),
          ),
          SizedBox(
            height: _size.height * 0.03,
          ),
        ],
      ),
    );
  }
}
