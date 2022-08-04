import 'package:flutter/material.dart';

import 'timer_provider/pages/timer_page/timer_page.dart';

class ProviderApp extends StatelessWidget {
  const ProviderApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minimalist State Manager',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TimerPage(),
    );
  }
}
