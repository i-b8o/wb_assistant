import 'package:auth_repo/auth_repo.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({Key? key, required this.user}) : super(key: key);
  final User user;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.grey,
      child: Column(children: [
        Text(user.email),
        Text(user.expires),
        Text(user.password),
        Text(user.type),
      ]),
    );
  }
}
