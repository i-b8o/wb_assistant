import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/instance_manager.dart';
import 'package:wb_assistant/controllers/authentication_controller.dart';
import 'package:wb_assistant/controllers/local_storage_controller.dart';

import 'rounded_password_field_obscure_controller.dart';

class AllControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthenticationController>(() => AuthenticationController());
    Get.lazyPut<LocalStorageController>(() => LocalStorageController());
    Get.lazyPut<RoundedPasswordFieldObscureController>(
        () => RoundedPasswordFieldObscureController());
  }
}
