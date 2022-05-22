import 'package:flutter/material.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool signIn, mobile;

  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.signIn = true,
    required this.fontSize,
    this.mobile = true,
    this.onPressed = _defaultFunction,
  }) : super(key: key);
  static _defaultFunction() {}

  final double fontSize;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: mobile ? _width : _width * 0.5,
      child: Padding(
        padding: EdgeInsets.only(right: mobile ? 0 : _width * 0.05),
        child: Row(
          mainAxisAlignment:
              mobile ? MainAxisAlignment.center : MainAxisAlignment.end,
          children: [
            Text(
              signIn ? "Ещё нет аккаунта?" : "Уже есть аккаунт?",
              style: TextStyle(
                  color: const Color.fromRGBO(61, 57, 74, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: fontSize),
            ),
            TextButton(
              onPressed: onPressed,
              child: Text(signIn ? "Зарегистрироваться" : "Войти",
                  style: TextStyle(
                      color: const Color.fromRGBO(54, 133, 240, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: fontSize)),
            )
          ],
        ),
      ),
    );
  }
}
