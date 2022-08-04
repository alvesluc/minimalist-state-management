import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../timer_page_controller.dart';

class TimerTextWidget extends StatelessWidget {
  const TimerTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.read<TimerPageController>();

    return ValueListenableBuilder<String>(
      valueListenable: controller.timeLeftNotifier,
      builder: (context, timeLeft, _) {
        return Text(
          timeLeft,
          style: Theme.of(context).textTheme.headline2,
        );
      },
    );
  }
}
