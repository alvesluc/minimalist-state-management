import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'src/minimalist_app.dart';
import 'src/timer/services/service_locator.dart';

void main() async {
  await setupGetIt();
  runApp(const MinimalistApp());
}
