import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wb_assistant/views/confirm/confirm_email.dart';

import '../../bloc/signup/signup_bloc.dart';
import '../../constants.dart';
import '../sign_in/sign_in.dart';
import 'landscape/sign_up_landscape.dart';
import 'portrait/sign_up_portrait.dart';
import 'thick_portrait/sign_up_thick_portrait.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({
    Key? key,
  }) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  void onPress(BuildContext context, TextEditingController email, pass, user) {
    if (email.text.isNotEmpty && pass.text.isNotEmpty && user.text.isNotEmpty) {
      context.read<SignupBloc>().add(SignupRequest(
          username: user.text, email: email.text, password: pass.text));
    }
  }

  void alreadyHaveAccountCheckOnPressed(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SignInPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('SignUpPage');
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => SignupBloc(),
      child: BlocListener<SignupBloc, SignupState>(
        listener: (context, state) {
          if (state is SignupFailedState) {
            Flushbar(
              title: "Ошибка",
              message: state.message,
              duration: const Duration(seconds: 3),
            ).show(context);
          }
        },
        child: BlocBuilder<SignupBloc, SignupState>(
          builder: (context, state) {
            if (state is SignupSuccessState) {
              return ConfirmEmailPage(
                email: state.email,
                password: state.password,
              );
            }
            return Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: Constants.bgColor,
              body: SizedBox(
                  width: double.infinity,
                  height: size.height,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      bool isPortrait = MediaQuery.of(context).orientation ==
                          Orientation.portrait;
                      double aspectRatio =
                          constraints.maxWidth / constraints.maxHeight;
                      if (isPortrait) {
                        return aspectRatio > 0.55
                            ? SignUpThickPortrait(
                                emailController: emailController,
                                passwordController: passwordController,
                                usernameController: usernameController,
                                onPress: onPress,
                                alreadyHaveAccountCheckOnPressed:
                                    alreadyHaveAccountCheckOnPressed,
                              )
                            : SignUpPortrait(
                                alreadyHaveAccountCheckOnPressed:
                                    alreadyHaveAccountCheckOnPressed,
                                emailController: emailController,
                                passwordController: passwordController,
                                usernameController: usernameController,
                                onPress: onPress,
                              );
                      } else {
                        return SignUpLandscape(
                          alreadyHaveAccountCheckOnPressed:
                              alreadyHaveAccountCheckOnPressed,
                          emailController: emailController,
                          passwordController: passwordController,
                          usernameController: usernameController,
                          onPress: onPress,
                        );
                      }
                    },
                  )),
            );
          },
        ),
      ),
    );
  }
}
