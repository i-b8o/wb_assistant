import 'package:shared_preferences/shared_preferences.dart';

class StorageRepository {
  Future<String> getJWT() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print("Get from storage: ${prefs.getString("jwt") ?? ''}");
    return prefs.getString("jwt") ?? '';
  }

  Future<String> getApiKey() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print("Get from storage: ${prefs.getString("api-key") ?? ''}");
    return prefs.getString("api-key") ?? '';
  }

  Future<void> setJWT(String jwt) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('jwt', jwt);
  }

  Future<void> setApiKey(String key) async {
    print(key);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('api-key', key);
  }

  Future<void> setApiKeyNew(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('new-api-key', key);
  }

  Future<void> deleteApiKey() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('api-key');
  }

  Future<void> deleteApiKeyNew() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('new-api-key');
  }
}
