import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wb_assistant/views/confirm/confirm_email.dart';
import 'package:wb_assistant/views/home/home.dart';

import '../../bloc/signin/signin_bloc.dart';
import '../components/responsive_widget.dart';
import '../sign_up/sign_up_page.dart';
import 'landscape/sign_in_landscape.dart';
import 'portrait/sign_in_portrait.dart';
import 'thick_portrait/sign_in_thick_portrait.dart';

// Navigator pop all previous SignUps, signIns and Welcomes
class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  void onPress(BuildContext context, TextEditingController email, pass) {
    if (email.text.isNotEmpty && pass.text.isNotEmpty) {
      context
          .read<SigninBloc>()
          .add(SigninRequest(email: email.text, password: pass.text));
    }
  }

  void alreadyHaveAccountCheckOnPressed(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SignUpPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    print("SignInPage");
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => SigninBloc(),
      child: BlocListener<SigninBloc, SigninState>(
        listener: (context, state) {
          if (state is SigninFailedState) {
            Flushbar(
              title: "Ошибка",
              message: state.message,
              duration: const Duration(seconds: 3),
            ).show(context);
          }
        },
        child: BlocBuilder<SigninBloc, SigninState>(
          builder: (context, state) {
            if (state is SigninSuccessed) {
              print("SigninSuccessed ${state.user.email}");
              return Home(
                user: state.user,
              );
            } else if (state is EmailIsNotConfirmed) {
              return ConfirmEmailPage(
                  email: state.email, password: state.password);
            }
            return Scaffold(
              resizeToAvoidBottomInset: false,
              body: SizedBox(
                  width: double.infinity,
                  height: size.height,
                  child: ResponsiveWidget(
                    portrait: SignInPortrait(
                      emailController: emailController,
                      passwordController: passwordController,
                      onPress: onPress,
                      alreadyHaveAccountCheckOnPressed:
                          alreadyHaveAccountCheckOnPressed,
                    ),
                    thickPortrait: SignInThickPortrait(
                        alreadyHaveAccountCheckOnPressed:
                            alreadyHaveAccountCheckOnPressed,
                        emailController: emailController,
                        passwordController: passwordController,
                        onPress: onPress),
                    landscape: SignInLandscape(
                        alreadyHaveAccountCheckOnPressed:
                            alreadyHaveAccountCheckOnPressed,
                        emailController: emailController,
                        passwordController: passwordController,
                        onPress: onPress),
                  )),
            );
          },
        ),
      ),
    );
  }
}
