import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wb_assistant/bloc/passwordtextfield/passwordtextfield_bloc.dart';

import '../../constants.dart';

class PasswordTextFieldLandscape extends StatelessWidget {
  const PasswordTextFieldLandscape({Key? key, required this.controller})
      : super(key: key);
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => PasswordtextfieldBloc(),
      child: SizedBox(
        width: size.width * 0.30,
        height: size.height * 0.08,
        child: BlocBuilder<PasswordtextfieldBloc, PasswordtextfieldState>(
          builder: (context, state) {
            if (state is PasswordtextfieldPushed) {
              return TextField(
                obscureText: state.obscure,
                style: TextStyle(fontSize: size.height * 0.02),
                textAlignVertical: TextAlignVertical.center,
                controller: controller,
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
                      horizontal: size.width * 0.01,
                    ),
                    suffixIcon: InkWell(
                      onTap: () {
                        context.read<PasswordtextfieldBloc>().add(Pushed());
                      },
                      child: Icon(
                        state.obscure
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: Constants.greyColor,
                        size: size.height * 0.03,
                      ),
                    )),
              );
            }
            return TextField(
              obscureText: true,
              style: TextStyle(fontSize: size.height * 0.02),
              textAlignVertical: TextAlignVertical.center,
              controller: controller,
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
                    horizontal: size.width * 0.01,
                  ),
                  suffixIcon: InkWell(
                    onTap: () {
                      context.read<PasswordtextfieldBloc>().add(Pushed());
                    },
                    child: Icon(
                      Icons.visibility_off_outlined,
                      color: Constants.greyColor,
                      size: size.height * 0.03,
                    ),
                  )),
            );
          },
        ),
      ),
    );
  }
}
