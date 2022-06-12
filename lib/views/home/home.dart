import 'package:another_flushbar/flushbar.dart';
import 'package:auth_repo/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:wb_assistant/helpers/custom_icons.dart';
import 'package:wb_assistant/views/wb_static/wb_static_page.dart';

import '../../bloc/home/home_bloc.dart';
import '../../constants.dart';
import '../settings/settings_page.dart';

class Home extends StatelessWidget {
  Home({Key? key, required this.user}) : super(key: key);
  final User user;
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return BlocListener<HomeBloc, HomeState>(
            listener: (context, state) {
              if (state is FaildState) {
                Flushbar(
                  title: "Ошибка",
                  message: state.message,
                  duration: const Duration(seconds: 3),
                ).show(context);
              }
            },
            child: Scaffold(
              backgroundColor: Color.fromRGBO(249, 248, 254, 1),
              bottomNavigationBar: Container(
                  height: size.height * 0.1,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30)),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                    child: BottomNavigationBar(
                      type: BottomNavigationBarType.fixed,
                      currentIndex: context.read<HomeBloc>().tab,
                      onTap: (int index) {
                        context.read<HomeBloc>().tab = index;
                        context
                            .read<HomeBloc>()
                            .add(BottomNavItemPushedEvent());
                      },
                      selectedLabelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * 0.03),
                      unselectedLabelStyle: TextStyle(
                        color: Constants.headerColor,
                        fontSize: size.width * 0.03,
                      ),
                      selectedItemColor: Color.fromRGBO(53, 72, 138, 1),
                      items: <BottomNavigationBarItem>[
                        BottomNavigationBarItem(
                          activeIcon: Icon(
                            Custom.home,
                            color: Color.fromRGBO(53, 72, 138, 1),
                            size: size.width * 0.05,
                          ),
                          icon: Icon(
                            Custom.home,
                            color: Constants.headerColor,
                            size: size.width * 0.05,
                          ),
                          label: "Главная",
                        ),
                        BottomNavigationBarItem(
                          activeIcon: Icon(
                            Custom.package,
                            color: Color.fromRGBO(53, 72, 138, 1),
                            size: size.width * 0.05,
                          ),
                          icon: Icon(
                            Custom.package,
                            color: Constants.headerColor,
                            size: size.width * 0.05,
                          ),
                          label: "Поставки",
                        ),
                        BottomNavigationBarItem(
                          activeIcon: Icon(
                            Custom.alarm,
                            color: Color.fromRGBO(53, 72, 138, 1),
                            size: size.width * 0.05,
                          ),
                          icon: Icon(
                            Custom.alarm,
                            color: Constants.headerColor,
                            size: size.width * 0.05,
                          ),
                          label: "Уведомления",
                        ),
                        BottomNavigationBarItem(
                          activeIcon: Icon(
                            Custom.cog,
                            color: Color.fromRGBO(53, 72, 138, 1),
                            size: size.width * 0.05,
                          ),
                          icon: Icon(
                            Custom.cog,
                            color: Constants.headerColor,
                            size: size.width * 0.05,
                          ),
                          label: "Настройки",
                        ),
                      ],
                    ),
                  )),
              body: (state is HomeInitial)
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          SizedBox(
                            height: size.height * 0.07,
                          ),
                          Text(
                            "Главная",
                            style: TextStyle(
                                fontSize: size.height * 0.02,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                          Text(
                            user.username,
                            style: TextStyle(
                                fontSize: size.height * 0.018,
                                fontWeight: FontWeight.bold,
                                color: Constants.greyColor),
                          ),
                          SizedBox(
                            height: size.height * 0.04,
                          ),
                        ])
                  : (state is WbStaticState)
                      ? WbStaticPage(
                          apiKey: state.apiKey,
                        )
                      : (state is AlarmState)
                          ? Container(
                              child: Text("Уведомления."),
                            )
                          : (state is SettingsState)
                              ? SettingsPage()
                              : Container(),
            ),
          );
        },
      ),
    );
  }
}
