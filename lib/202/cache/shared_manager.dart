import 'package:flutter_veli_full/202/cache/shared_not_initialize.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SharedKeys { counter }

class SharedManager {
  SharedPreferences? preferences;
  SharedManager() {
    init();
  }

  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  //preferences initialize edilmis mi diye kontrol etmemizi saglar
  //eger bir sorundan dolayi initialize edilememisse
  //alt satira inmeyecegi icin exxceptionda kalacagi icin daha guvenli kod yazmis oluruz
  void _checkPreferences() {
    if (preferences == null) {
      throw SharedNotInitializeException();
    }
  }

  Future<void> saveString(SharedKeys key, String value) async {
    _checkPreferences();
    await preferences?.setString(key.name, value);
  }

  String? getString(SharedKeys key) {
    _checkPreferences();

    return preferences?.getString(key.name);
  }

  Future<bool> removeItem(SharedKeys key) async {
    _checkPreferences();

    return (await preferences?.remove(key.name)) ?? false;
  }
}
