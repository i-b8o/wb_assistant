import 'package:another_flushbar/flushbar.dart';
import 'package:auth_repo/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wb_api_repo/wb_api_repo.dart';
import 'package:wb_assistant/presentation/custom_icons.dart';

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
                        ? Supplies(
                            supplies: state.supplies,
                          )
                        : (state is AlarmState)
                            ? Container(
                                child: Text("Уведомления."),
                              )
                            : (state is SettingsState)
                                ? SettingsPage()
                                : Container(),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Supplies extends StatelessWidget {
  Supplies({
    Key? key,
    required this.supplies,
  }) : super(key: key);

  List<Supply> supplies;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        child: ListView(
      children: supplies
          .map((e) => Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                child: Column(
                  children: [
                    Container(
                        width: size.width * 0.5,
                        child: Text(
                          'Номер поставки ${e.id.toString()}',
                          style: TextStyle(color: Colors.green),
                        )),
                    Container(
                        width: size.width * 0.5, child: Text(e.warehouseName)),
                    Container(
                        width: size.width * 0.5,
                        child: Text(e.dateTime.toString())),
                    Container(
                        width: size.width * 0.5,
                        child: Column(
                          children: e.items
                              .map((item) => Container(
                                    child: Column(children: [
                                      Image.network(item.img),
                                      Text(item.article),
                                      Text(item.barCode),
                                      Text(item.status),
                                      Text(item.techSize),
                                      Text(item.id.toString()),
                                      Text(item.quantity.toString()),
                                      Text(item.totalPrice.toString()),
                                    ]),
                                  ))
                              .toList(),
                        )),
                  ],
                ),
              ))
          .toList(),
    ));
  }
}
