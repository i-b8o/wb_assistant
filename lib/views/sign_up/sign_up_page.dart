import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wb_assistant/views/confirm/confirm_email.dart';

import '../../bloc/signup/signup_bloc.dart';
import '../../constants.dart';
import 'landscape/sign_up_landscape.dart';
import 'portrait/sign_up_portrait.dart';
import 'thick_portrait/sign_up_thick_portrait.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('SignUpPage');
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => SignupBloc(),
      child: BlocListener<SignupBloc, SignupState>(
        listener: (context, state) {
          if (state is SignupFailedState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: BlocBuilder<SignupBloc, SignupState>(
          builder: (context, state) {
            if (state is SignupSuccessState) {
              return const ConfirmEmailPage();
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
                            ? const SignUpThickPortrait()
                            : const SignUpPortrait();
                      } else {
                        return const SignUpLandscape();
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
