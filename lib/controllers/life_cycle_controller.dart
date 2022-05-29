import 'package:get/get.dart';

import 'package:wb_assistant/controllers/local_storage_controller.dart';

class LifeCycleController extends SuperController {
  LocalStorageController localStorageController;

  LifeCycleController({
    required this.localStorageController,
  });
  @override
  void onDetached() {}

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  void onResumed() {
    print("Onresumed");

    localStorageController.reset();
  }
}
