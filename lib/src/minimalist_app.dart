import 'package:flutter/material.dart';

import 'timer/pages/timer_page/timer_page.dart';

class MinimalistApp extends StatelessWidget {
  const MinimalistApp({Key? key}) : super(key: key);

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
