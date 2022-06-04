import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wb_assistant/bloc/confirm_email/confirmemail_bloc.dart';

import '../../constants.dart';
import 'confirm_email_large.dart';
import 'confirm_email_portrait.dart';
import 'confirm_email_thick_portrait.dart';

class ConfirmEmailPage extends StatelessWidget {
  const ConfirmEmailPage({
    Key? key,
    required this.email,
    required this.password,
  }) : super(key: key);
  final String email;
  final String password;
  void onPress(
    BuildContext context,
  ) {
    context
        .read<ConfirmemailBloc>()
        .add(ConfirmEmailResendRequest(email: email, password: password));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => ConfirmemailBloc(),
      child: BlocListener<ConfirmemailBloc, ConfirmemailState>(
        listener: (context, state) {
          if (state is ConfirmemailFail) {
            Flushbar(
              title: "Ошибка",
              message: state.message,
              duration: const Duration(seconds: 3),
            ).show(context);
          } else if (state is ConfirmemailSuccess) {
            Flushbar(
              title: "Отлично!",
              message: "Письмо опять отправлено!",
              duration: const Duration(seconds: 3),
            ).show(context);
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Constants.bgColor,
          body: SizedBox(
            width: double.infinity,
            height: size.height,
            child: LayoutBuilder(
              builder: (context, constraints) {
                bool isPortrait =
                    MediaQuery.of(context).orientation == Orientation.portrait;
                double aspectRatio =
                    constraints.maxWidth / constraints.maxHeight;
                if (isPortrait) {
                  return aspectRatio > 0.55
                      ? ConfirmEmailThickPortrait(
                          onPress: () {
                            onPress(context);
                          },
                        )
                      : ConfirmEmailPortrait(
                          onPress: () {
                            onPress(context);
                          },
                        );
                } else {
                  return ConfirmEmailLarge(
                    onPress: () {
                      onPress(context);
                    },
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
