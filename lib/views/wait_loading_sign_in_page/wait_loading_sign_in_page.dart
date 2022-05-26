import 'package:flutter/material.dart';

// TODO Create Wait Sign Page
class WaitLoadingSignInPage extends StatelessWidget {
  const WaitLoadingSignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("WaitLoadingSignInPage");
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: const Text("Wait Sign IN"),
    );
  }
}
