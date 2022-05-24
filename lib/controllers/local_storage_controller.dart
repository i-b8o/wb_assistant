import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wb_assistant/models/credentials.dart';

class LocalStorageController extends GetxController {
  static var jwtInStorage = false.obs;
  var credentialsInStorage = false.obs;
  static String jwtToken = "";
  var serverError = "".obs;

  LocalStorageController() {
    getJWT().then((token) {
      if (token.isNotEmpty) {
        // JWT exists in local storage
        jwtInStorage.value = true;
        jwtToken = token;
        // Get details from server
        // BeRepository.details(token).then((response) {
        //   if (response.statusCode == 200) {
        //     details = Details.fromJson(jsonDecode(response.body));
        //     gotDetails.value = true;
        //   } else {
        //     // if error
        //     serverError.value =
        //         ServerErr.fromJson(jsonDecode(response.body)).message;
        //   }
        // });
      } else {
        // JWT not exists in local storage
        jwtInStorage.value = false;
        // getCredentials().then((credentials) {
        //   // Try to get credentials from local storage to SignIn
        //   if (credentials.email.isNotEmpty && credentials.password.isNotEmpty) {
        //     // If credentials exist in local storage
        //     if (credentialsInStorage.isFalse) {
        //       credentialsInStorage.toggle();
        //     }
        //     // Try to Sign In
        //     BeRepository.signInUser(credentials.email, credentials.password)
        //         .then((response) {
        //       if (response.statusCode == 200) {}
        //     });
        //     return;
        //   } else {
        //     if (credentialsInStorage.isTrue) {
        //       credentialsInStorage.toggle();
        //     }
        //   }
        // });
      }
    });
  }

  Future<String> getUsername() async {
    return await GetStorage().read('username');
  }

  Future<String> getPassword() async {
    return await GetStorage().read('password');
  }

  static Future<String> getJWT() async {
    return await GetStorage().read('jwt') ?? "";
  }

  static Future<void> setJWT(String jwt) async {
    jwtToken = jwt;
    if (jwt.isEmpty) {
      return;
    }
    GetStorage().write('jwt', jwt);
    jwtInStorage.value = true;
  }

  static void setUsername(String username) async {
    if (username.isEmpty) {
      return;
    }
    GetStorage().write('username', username);
  }

  void setPassword(String password) async {
    if (password.isEmpty) {
      return;
    }
    GetStorage().write('password', password);
  }

  static Future<Credentials> getCredentials() async {
    String email = await GetStorage().read('email');
    String password = await GetStorage().read('password');
    return Credentials(email: email, password: password);
  }

  static void setCredentials(Credentials credentials) async {
    GetStorage().write('email', credentials.email);
    GetStorage().write('password', credentials.password);
  }
}
