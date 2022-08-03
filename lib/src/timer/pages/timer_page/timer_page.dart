import 'package:flutter/material.dart';

import '../../services/service_locator.dart';
import 'timer_page_controller.dart';
import 'widgets/buttons_container.dart';
import 'widgets/timer_text_widget.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  final controller = getIt.get<TimerPageController>();

  @override
  void initState() {
    super.initState();
    controller.initTimerState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Timer"),
      ),
      body: Center(
        child: Column(
          children: const [
            TimerTextWidget(),
            SizedBox(height: 20),
            ButtonsContainer(),
          ],
        ),
      ),
    );
  }
}
