import 'package:get/get.dart';

class RoundedPasswordFieldObscureController extends GetxController {
  var obscure = false.obs;
  void toggle() {
    obscure.toggle();
    print("PRESSED: ${obscure.value}");
  }
}
