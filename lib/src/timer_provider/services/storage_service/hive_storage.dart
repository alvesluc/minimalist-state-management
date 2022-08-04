import 'package:hive_flutter/hive_flutter.dart';

import 'storage_service.dart';

class HiveStorage implements StorageService {
  static const _timeLeftBoxName = "timeLeftBox";
  static const _timeLeftKey = "timeLeft";

  @override
  Future<int?> getTimeLeft() async {
    var box = await Hive.openBox(_timeLeftBoxName);
    return box.get(_timeLeftKey);
  }

  @override
  Future<void> saveTimeLeft(int seconds) async {
    var box = await Hive.openBox(_timeLeftBoxName);
    box.put(_timeLeftKey, seconds);
  }
}
