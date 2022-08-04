import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../timer_page_controller.dart';

class StartButton extends StatelessWidget {
  const StartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.read<TimerPageController>();

    return FloatingActionButton(
      elevation: 1,
      onPressed: () {
        controller.start();
      },
      child: const Icon(Icons.play_arrow),
    );
  }
}
