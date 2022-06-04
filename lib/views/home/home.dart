import 'package:auth_repo/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:wb_assistant/presentation/custom_icons.dart';
import 'package:wb_assistant/views/components/search_text_field_thick_portrait.dart';

import '../../constants.dart';

class Home extends StatelessWidget {
  Home({Key? key, required this.user}) : super(key: key);
  final User user;
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
          height: size.height * 0.1,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(
                    Custom.home,
                    color: Constants.greyColor,
                    size: size.height * 0.03,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Custom.key,
                    color: Constants.greyColor,
                    size: size.height * 0.03,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Custom.alarm,
                    color: Constants.greyColor,
                    size: size.height * 0.03,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Custom.cog,
                    color: Constants.greyColor,
                    size: size.height * 0.03,
                  ),
                  label: "",
                ),
              ],
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: size.height * 0.07,
          ),
          Text(
            "Добро пожаловать",
            style: TextStyle(
                fontSize: size.height * 0.02, fontWeight: FontWeight.bold),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SearchTextFieldThickPortrait(controller: searchController),
              Container(
                height: size.width * 0.12,
                width: size.width * 0.12,
                color: Constants.greenColor,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                  ),
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}
