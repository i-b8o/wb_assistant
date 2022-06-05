import 'package:auth_repo/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wb_assistant/presentation/custom_icons.dart';

import '../../bloc/home/home_bloc.dart';
import '../../constants.dart';
import '../settings/settings_page.dart';

class Home extends StatelessWidget {
  Home({Key? key, required this.user}) : super(key: key);
  final User user;
  final TextEditingController searchController = TextEditingController();
  int currentTab = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Constants.bgColor,
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
                    currentIndex: currentTab,
                    onTap: (int index) {
                      currentTab = index;
                      context
                          .read<HomeBloc>()
                          .add(BottomNavItemPushedEvent(index));
                    },
                    selectedLabelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.width * 0.03),
                    unselectedLabelStyle: TextStyle(
                      color: Constants.headerColor,
                      fontSize: size.width * 0.03,
                    ),
                    selectedItemColor: Constants.btnColor,
                    items: <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        activeIcon: Icon(
                          Custom.home,
                          color: Constants.btnColor,
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
                          color: Constants.btnColor,
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
                          color: Constants.btnColor,
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
                          color: Constants.btnColor,
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
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: (state is HomeInitial)
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
                  : (state is SupplyState)
                      ? Container(
                          child: Text("Поставки"),
                        )
                      : (state is AlarmState)
                          ? Container(
                              child: Text("Уведомления"),
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
