import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../pages/timer_page/timer_page_controller.dart';
import 'storage_service/hive_storage.dart';
import 'storage_service/shared_preference_storage.dart';
import 'storage_service/storage_service.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt({String storageService = 'hive'}) async {
  getIt.registerLazySingleton<TimerPageController>(() => TimerPageController());
  if (storageService == 'hive') {
    await Hive.initFlutter();
    getIt.registerLazySingleton<StorageService>(() => HiveStorage());
  } else {
    getIt.registerLazySingleton<StorageService>(() => SharedPreferencesStorage());
  }
}
