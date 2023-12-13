import 'package:ristu_intern_challenge/core/shared/constant/prefs_key.dart';
import 'package:ristu_intern_challenge/core/shared/prefs/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<void> saveBearerToken(String token);
  Future<void> saveNameUser(String name);
  Future<void> saveStatus(int status);
  Future<void> saveMessages(String msg);
  Future<void> logout();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  AuthLocalDataSourceImpl(this.prefs);

  final SharedPrefs prefs;

  @override
  Future<void> saveBearerToken(String token) async {
    await prefs.putString(PrefsKey.tokenBearer, token);
  }

  @override
  Future<void> saveNameUser(String name) async {
    await prefs.putString(PrefsKey.saveNameUser, name);
  }

  @override
  Future<void> logout() async {
    await prefs.clearKey(PrefsKey.tokenBearer);
    await prefs.clearKey(PrefsKey.saveNameUser);
    await prefs.clearKey(PrefsKey.saveStatus);
  }

  @override
  Future<void> saveStatus(int status) async {
    await prefs.putInt(PrefsKey.saveStatus, status);
  }

  @override
  Future<void> saveMessages(String msg) async {
    await prefs.putString(PrefsKey.saveMessages, msg);
  }
}
