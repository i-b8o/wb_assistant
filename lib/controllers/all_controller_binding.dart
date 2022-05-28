import 'package:get/instance_manager.dart';
import 'package:wb_assistant/controllers/authentication_controller.dart';
import 'package:wb_assistant/controllers/local_storage_controller.dart';

import 'rounded_password_field_obscure_controller.dart';

class AllControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthenticationController());
    Get.put(LocalStorageController());
    Get.put(RoundedPasswordFieldObscureController());
  }
}
