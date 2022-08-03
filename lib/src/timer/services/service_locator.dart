import 'package:get_it/get_it.dart';

import '../pages/timer_page/timer_page_controller.dart';
import 'storage_service/shared_preference_storage.dart';
import 'storage_service/storage_service.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton<TimerPageController>(() => TimerPageController());
  getIt.registerLazySingleton<StorageService>(() => SharedPreferenceStorage());
}
