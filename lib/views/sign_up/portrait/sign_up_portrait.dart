import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wb_assistant/views/components/btn_thick_portrait.dart';
import 'package:wb_assistant/views/components/email_text_field_thick_portrait.dart';
import 'package:wb_assistant/views/components/header_thick_portrait.dart';
import 'package:wb_assistant/views/components/name_text_field_thick_portrait.dart';
import 'package:wb_assistant/views/components/password_text_field_thick_portrait.dart';

import '../../../bloc/signup/signup_bloc.dart';
import '../../../constants.dart';
import '../../components/components.dart';

// TODO use MediaQueryData widget
class SignUpPortrait extends StatelessWidget {
  const SignUpPortrait({
    Key? key,
    required this.emailController,
    required this.usernameController,
    required this.passwordController,
    required this.onPress,
    required this.alreadyHaveAccountCheckOnPressed,
  }) : super(key: key);
  final TextEditingController emailController;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final void Function(BuildContext context, TextEditingController email,
      TextEditingController pass, TextEditingController user) onPress;
  final void Function(BuildContext context) alreadyHaveAccountCheckOnPressed;
  @override
  Widget build(BuildContext context) {
    print('SignUpPortrait');
    Size size = MediaQuery.of(context).size;
    bool keyboard = MediaQuery.of(context).viewInsets.bottom > 0.0;

    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Constants.bgColor,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              keyboard
                  ? SizedBox(height: size.height * 0.1)
                  : const HeaderThickPortrait(
                      headerText: Constants.signUpHeaderText,
                      greetingText: Constants.signUpGreetingText),
              Column(
                children: [
                  TextFieldsWidget(
                    fields: [
                      NameTextFieldThickPortrait(
                          controller: usernameController),
                      SizedBox(height: size.height * 0.01),
                      EmailTextFieldThickPortrait(
                        controller: emailController,
                      ),
                      SizedBox(height: size.height * 0.01),
                      PasswordTextFieldThickPortrait(
                        controller: passwordController,
                      )
                    ],
                  ),
                  keyboard
                      ? SizedBox(
                          height: size.height * 0.05,
                        )
                      : SizedBox(
                          height: size.height * 0.1,
                        ),
                  BtnThickPortrait(
                    text: Constants.signUpBtnText,
                    press: () {
                      onPress(context, emailController, passwordController,
                          usernameController);
                    },
                  )
                ],
              ),
              SizedBox(
                height: size.width * 0.2,
              ),
              AlreadyHaveAnAccountCheck(
                onPressed: () {
                  alreadyHaveAccountCheckOnPressed(context);
                },
                signIn: false,
                fontSize: size.width * 0.04,
              ),
            ],
          ),
        );
      },
    );
  }
}
