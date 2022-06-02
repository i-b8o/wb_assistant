import 'package:flutter/material.dart';

import 'package:wb_assistant/views/components/btn_thick_portrait.dart';
import 'package:wb_assistant/views/components/header_thick_portrait.dart';

import '../../../constants.dart';

import '../../components/already_have_an_account_check.dart';
import '../../components/welcome_text_fields.dart';

class SignUpThickPortrait extends StatelessWidget {
  const SignUpThickPortrait({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('SignUpThickPortrait');
    Size size = MediaQuery.of(context).size;
    bool keyboard = MediaQuery.of(context).viewInsets.bottom > 0.0;

    return ListView(
      padding: EdgeInsets.only(
        left: size.width * 0.07,
        right: size.width * 0.07,
      ),
      children: [
        keyboard
            ? SizedBox(height: size.height * 0.1)
            : const HeaderThickPortrait(
                headerText: Constants.signUpHeaderText,
                greetingText: Constants.signUpGreetingText,
              ),
        TextFieldsWidget(
          fields: [
            SizedBox(
              width: size.width * 0.85,
              height: size.height * 0.08,
              child: TextField(
                style: TextStyle(fontSize: size.height * 0.02),
                textAlignVertical: TextAlignVertical.center,
                onChanged: (value) {
                  print("Change value: $value");
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: Colors.white, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: Colors.white, width: 2.0),
                  ),
                  hintText: Constants.nameInputText,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: size.height * 0.03,
                    horizontal: size.width * 0.04,
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.01),
            SizedBox(
              width: size.width * 0.85,
              height: size.height * 0.08,
              child: TextField(
                style: TextStyle(fontSize: size.height * 0.02),
                textAlignVertical: TextAlignVertical.center,
                onChanged: (value) {},
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: Colors.white, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: Colors.white, width: 2.0),
                  ),
                  hintText: Constants.emailInputText,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: size.height * 0.03,
                    horizontal: size.width * 0.04,
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.01),
            SizedBox(
              width: size.width * 0.85,
              height: size.height * 0.08,
              child: TextField(
                obscureText: false,
                style: TextStyle(fontSize: size.height * 0.02),
                textAlignVertical: TextAlignVertical.center,
                onChanged: (value) {},
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                    ),
                    hintText: Constants.passInputText,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: size.height * 0.03,
                      horizontal: size.width * 0.04,
                    ),
                    suffixIcon: InkWell(
                      onTap: () {},
                      child: Icon(
                        true
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: Constants.greyColor,
                        size: size.height * 0.03,
                      ),
                    )),
              ),
            ),
          ],
        ),
        keyboard
            ? SizedBox(
                height: size.height * 0.05,
              )
            : SizedBox(
                height: size.height * 0.1,
              ),
        BtnThickPortrait(text: Constants.signUpBtnText, press: () => {}),
        SizedBox(
          height: size.width * 0.1,
        ),
        AlreadyHaveAnAccountCheck(
          onPressed: () => {},
          signIn: false,
          fontSize: size.width * 0.03,
        ),
      ],
    );
  }
}
