import 'package:flutter/material.dart';

import 'src/minimalist_app.dart';
import 'src/timer/services/service_locator.dart';

void main() {
  setupGetIt();
  runApp(const MinimalistApp());
}
