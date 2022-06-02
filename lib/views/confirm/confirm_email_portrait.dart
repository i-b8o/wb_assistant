import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:wb_assistant/constants.dart';
import 'package:wb_assistant/controllers/authentication_controller.dart';
import 'package:wb_assistant/views/sign_in/sign_in.dart';

class ConfirmEmailPortrait extends StatelessWidget {
  const ConfirmEmailPortrait({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
            size: size.width * 0.1,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Image.asset(
            "assets/images/clouds.png",
            // height: size.height * 0.5,
          ),
          SizedBox(
            height: size.height * 0.12,
          ),
          Text(
            Constants.confirmHeaderText,
            style: TextStyle(
                color: Constants.azureColor,
                fontWeight: FontWeight.bold,
                fontSize: size.height * 0.03),
          ),
          SizedBox(
            height: size.height * 0.025,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
            child: Text(
              Constants.confirmGreetingText,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Constants.azureColor,
                  // fontWeight: FontWeight.bold,
                  fontSize: size.height * 0.02),
            ),
          ),
          SizedBox(
            height: size.height * 0.1,
          ),
          SizedBox(
            width: size.width * 0.85,
            height: size.height * 0.06,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(size.width * 0.1),
              child: Container(
                color: const Color.fromRGBO(238, 94, 125, 1),
                child: TextButton(
                    onPressed: () {},
                    child: Text(Constants.confirmBtnText,
                        style: GoogleFonts.robotoMono(
                          fontSize: size.height * 0.02,
                          color: Colors.white,
                        ))),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
        ],
      ),
    );
  }
}
