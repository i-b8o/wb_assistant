import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wb_assistant/constants.dart';
import 'package:wb_assistant/helpers/custom_icons.dart';

import '../../bloc/settings/settings_bloc.dart';
import '../api_key/api_key.dart';
import 'widgets/settings_option.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => SettingsBloc(),
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          if (state is ApiKeyState) {
            return ApiKey();
          }
          if (state is SettingsInitial) {
            return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05,
                    vertical: size.height * 0.08),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Настройки",
                          style: TextStyle(
                              color: Constants.headerColor,
                              fontSize: size.height * 0.03,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    SettingsOption(
                      onTap: () {
                        context.read<SettingsBloc>().add(ApiKeyPressed());
                      },
                      text: "Ваша информация",
                      icon: Custom.person,
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    SettingsOption(
                      onTap: () {
                        context.read<SettingsBloc>().add(ApiKeyPressed());
                      },
                      text: "Уведомления",
                      icon: Custom.notifications,
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    SettingsOption(
                      onTap: () {
                        context.read<SettingsBloc>().add(ApiKeyPressed());
                      },
                      text: "Пароль",
                      icon: Custom.lock,
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    SettingsOption(
                      onTap: () {
                        print("DDDDDDD");
                        context.read<SettingsBloc>().add(ApiKeyPressed());
                      },
                      text: "Api Key",
                      icon: Custom.security,
                    ),
                    SizedBox(
                      height: size.height * 0.1,
                      child: const Divider(color: Constants.greyColor),
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Custom.logout,
                          size: size.height * 0.03,
                          color: Constants.btnColor,
                        ),
                        SizedBox(
                          width: size.width * 0.04,
                        ),
                        Text(
                          "Выйти",
                          style: TextStyle(
                              fontSize: size.height * 0.02,
                              color: Constants.btnColor),
                        ),
                        SizedBox(
                          width: size.width * 0.04,
                        ),
                      ],
                    )
                  ],
                ));
          }
          return Container();
        },
      ),
    );
  }
}
