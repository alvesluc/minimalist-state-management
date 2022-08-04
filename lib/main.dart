import 'package:flutter/material.dart';

import 'src/minimalist_app.dart';
import 'src/provider_app.dart';
import 'src/timer/services/service_locator.dart';

void main() async {
  // flutter run --dart-define=FLAVOR=GET_IT
  const flavor = String.fromEnvironment('FLAVOR', defaultValue: 'PROVIDER');

  if (flavor == 'PROVIDER') {
    runApp(const ProviderApp());
  } else {
    await setupGetIt();
    runApp(const MinimalistApp());
  }
}
