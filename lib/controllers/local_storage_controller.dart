import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/account.dart';
import '../models/user.dart';

class LocalStorageController extends GetxController {
  var userDataStored = false.obs;
  late List<Account> _accounts;
  late User user;
  LocalStorageController() {
    _accounts = <Account>[];
    user = User(email: "", username: '', accounts: _accounts, id: '');
    getUserData();
  }

  void getUserData() {
    var name = GetStorage().read('name');
    var email = GetStorage().read('email');
    var password = GetStorage().read('password');
    var accountType = GetStorage().read('type');
    var accountExpires = GetStorage().read('expires');
    if (email == null ||
        password == null ||
        accountType == null ||
        accountExpires == null) {
      if (userDataStored.isTrue) userDataStored.toggle();
      return;
    }

    if (userDataStored.isFalse) userDataStored.toggle();
    var _accounts = [
      Account(id: "", type: accountType, expires: accountExpires)
    ];
    user = User(username: name, email: email, accounts: _accounts, id: '');
  }

  void setUserData(String name, email, password, type, expires) {
    GetStorage().write('name', name);
    GetStorage().write('email', email);
    GetStorage().write('password', password);
    GetStorage().write('type', type);
    GetStorage().write('expires', expires);
    user = User(username: name, email: email, accounts: _accounts, id: '');
    if (userDataStored.isFalse) userDataStored.toggle();
  }
}
