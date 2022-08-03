import 'package:shared_preferences/shared_preferences.dart';

import 'storage_service.dart';

class SharedPreferencesStorage implements StorageService {
  static const _timeLeftKey = "timeLeft";

  @override
  Future<int?> getTimeLeft() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getInt(_timeLeftKey);
  }

  @override
  Future<void> saveTimeLeft(int seconds) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setInt(_timeLeftKey, seconds);
  }
}