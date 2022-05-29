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
  static String jwtToken = "";
  LocalStorageController() {
    getJWTFromLocalStorage().then((token) async {
      // JWT exists in local storage
      if (token.isNotEmpty) {
        jwtInStorage.value = true;
        jwtToken = token;
        // Try get details
        Details? details = await getAndSaveDetails(token);
        // If API response correctly
        if (details != null) {
          detailsInStorage.value = true;
        } else {
          detailsInStorage.value = false;
        }
      } else {
        // JWT does not exist in local storage

        jwtInStorage.value = false;
        detailsInStorage.value = false;
      }
    });
  }

  Future<Details?> getAndSaveDetails(String jwt) async {
    Details? details = await getDetailsFromAPI(jwt);
    if (details != null) {
      // Save details
      saveDetails(details);
      return details;
    } else {
      // JWT is expired
      // Try to get username and passwordfrom local storage
      String email = await getValue("email");
      String password = await getValue("password");
      if (email.isNotEmpty && password.isNotEmpty) {
        // Exist
        var response = await BeRepository.signInUser(email, password);
        if (response.statusCode == 200) {
          // Status OK
          TokenMessage tokenMessage =
              TokenMessage.fromJson(jsonDecode(response.body));
          // Save jwt
          await setJWT(tokenMessage.token);
          // Try to get and save details
          Details? details = await getDetailsFromAPI(jwt);
          if (details != null) {
            saveDetails(details);
          }

          return details;
        }
      }
    }
    return null;
  }

  Future<Details?> getDetailsFromAPI(String token) async {
    var response = await BeRepository.details(token);
    if (response.statusCode == 200) {
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
    await saveValue("username", details.username);
    await saveValue("email", details.email);
    await saveValue("password", details.password);
    await saveValue("expires", details.expires);
    await saveValue("type", details.type);
    await saveValue("id", details.id);
    detailsInStorage.value = true;
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
