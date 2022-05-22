import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wb_assistant/models/credentials.dart';

class LocalStorageController extends GetxController {
  var jwtInStorage = false.obs;
  var credentialsInStorage = false.obs;
  static Future<String> getJWT() async {
    return await GetStorage().read('jwt');
  }

  void setJWT(String jwt) async {
    GetStorage().write('jwt', jwt);
  }

  LocalStorageController() {
    getJWT().then((value) {
      if (value.isNotEmpty) {
        if (jwtInStorage.isFalse) jwtInStorage.toggle();
        return;
      } else {
        if (jwtInStorage.isTrue) jwtInStorage.toggle();
      }
    });
    getCredentials().then((credentials) {
      if (credentials.username.isNotEmpty && credentials.password.isNotEmpty) {
        if (credentialsInStorage.isFalse) {
          credentialsInStorage.toggle();
        }
        return;
      } else {
        if (credentialsInStorage.isTrue) {
          credentialsInStorage.toggle();
        }
      }
    });
  }

  Future<Credentials> getCredentials() async {
    String username = await GetStorage().read('username');
    String password = await GetStorage().read('password');
    return Credentials(username: username, password: password);
  }

  void setCredentials(Credentials credentials) async {
    GetStorage().write('username', credentials.username);
    GetStorage().write('password', credentials.password);
  }
}
