import 'package:shared_preferences/shared_preferences.dart';

class StorageRepository {
  Future<String> getJWT() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print("Get from storage: ${prefs.getString("jwt") ?? ''}");
    return prefs.getString("jwt") ?? '';
  }

  Future<void> setJWT(String jwt) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('jwt', jwt);
  }
}
