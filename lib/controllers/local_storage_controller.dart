import 'dart:convert';

import 'package:be_repo/be_repo.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../models/details.dart';
import '../models/token.dart';

class LocalStorageController extends GetxController {
  static var jwtInStorage = false.obs;
  var detailsInStorage = false.obs;
  var credentialsInStorage = false.obs;

  var isLoading = true.obs;

  var username = "".obs;
  var email = "".obs;
  var password = "".obs;
  var expires = "".obs;
  var type = "".obs;
  var id = "".obs;

  @override
  void onInit() {
    print("LocalStorageController onInit");
    super.onInit();
  }

  @override
  void onReady() {
    print("LocalStorageController onReady");
    fetchDetails();
    super.onReady();
  }

  @override
  void onClose() {
    print("LocalStorageController onClose");
    super.onClose();
  }

  static String jwtToken = "";

  void fetchDetails() async {
    print("fetchDetails");
    try {
      isLoading(true);
      print(isLoading.value);
      String token = await getJWTFromLocalStorage();
      if (token.isNotEmpty) {
        print("reset token.isNotEmpty");
        jwtInStorage.value = true;
        jwtToken = token;
        // Try get details
        Details? details = await getAndSaveDetails(token);
        // If API response correctly
        if (details != null) {
          print("reset details != null ${details.type}");
          detailsInStorage.value = true;
        } else {
          print("reset details != null else");
          detailsInStorage.value = false;
        }
      } else {
        print("JWT empty");
        // JWT does not exist in local storage

        jwtInStorage.value = false;
        detailsInStorage.value = false;
      }
      // getJWTFromLocalStorage().then((token) async {
      //   // JWT exists in local storage
      //   if (token.isNotEmpty) {
      //     print("reset token.isNotEmpty");
      //     jwtInStorage.value = true;
      //     jwtToken = token;
      //     // Try get details
      //     Details? details = await getAndSaveDetails(token);
      //     // If API response correctly
      //     if (details != null) {
      //       print("reset details != null ${details.type}");
      //       detailsInStorage.value = true;
      //     } else {
      //       print("reset details != null else");
      //       detailsInStorage.value = false;
      //     }
      //   } else {
      //     print("JWT empty");
      //     // JWT does not exist in local storage

      //     jwtInStorage.value = false;
      //     detailsInStorage.value = false;
      //   }
      // });
    } finally {
      print("Finally");
      isLoading(false);
    }
    update();
    print("update");
  }

  static savePasswordAndFetch(String key, value) async {}

  Future<Details?> getAndSaveDetails(String jwt) async {
    print("getAndSaveDetails");
    Details? details = await getDetailsFromAPI(jwt);
    if (details != null) {
      print("getAndSaveDetails details != null");
      // Save details
      saveDetails(details);
      return details;
    } else {
      print("getAndSaveDetails else");
      // JWT is expired
      // Try to get username and passwordfrom local storage
      String email = await getValue("email");
      String password = await getValue("password");
      if (email.isNotEmpty && password.isNotEmpty) {
        print("getAndSaveDetails email.isNotEmpty && password.isNotEmpty");
        // Exist
        var response = await BeRepository.signInUser(email, password);
        if (response.statusCode == 200) {
          print("getAndSaveDetails response.statusCode == 200");
          // Status OK
          TokenMessage tokenMessage =
              TokenMessage.fromJson(jsonDecode(response.body));
          // Save jwt
          await setJWT(tokenMessage.token);
          // Try to get and save details
          Details? details = await getDetailsFromAPI(jwt);
          if (details != null) {
            print("getAndSaveDetails details != null");
            saveDetails(details);
          }

          return details;
        }
      }
    }
    return null;
  }

  Future<Details?> getDetailsFromAPI(String token) async {
    print("getDetailsFromAPI");
    var response = await BeRepository.details(token);
    if (response.statusCode == 200) {
      print("getDetailsFromAPI 200");
      // OK
      Details details = Details.fromJson(jsonDecode(response.body));
      return details;
    }
    return null;
  }

  static Future<String> getValue(key) async {
    return await GetStorage().read(key);
  }

  static Future<String> getJWTFromLocalStorage() async {
    return await GetStorage().read('jwt') ?? "";
  }

  static Future<void> setJWT(String jwt) async {
    jwtToken = jwt;
    if (jwt.isEmpty) {
      return;
    }
    saveValue("jwt", jwt);
    jwtInStorage.value = true;
  }

  saveDetails(Details details) async {
    print("saveDetails: ${details.type}");
    type(details.type);
    username(details.username);
    email(details.email);
    password(details.password);
    expires(details.expires);
    type(details.type);
    id(details.id);

    if (details.email.isEmpty || details.type.isEmpty) return;

    await saveValue("username", details.username);
    await saveValue("email", details.email);
    await saveValue("password", details.password);
    await saveValue("expires", details.expires);
    await saveValue("type", details.type);
    await saveValue("id", details.id);
    detailsInStorage.value = true;
    update();
  }

  static Future<Details> loadDetails() async {
    String username = await getValue("username");

    String email = await getValue("email");
    String password = await getValue("password");
    String expires = await getValue("expires");
    String type = await getValue("type");
    String id = await getValue("id");

    return Details(
        id: id,
        email: email,
        expires: expires,
        type: type,
        username: username,
        password: password);
  }

  static saveValue(String key, value) async {
    if (value.isEmpty) {
      return;
    }
    GetStorage().write(key, value);
  }
}
