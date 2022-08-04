import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../timer_page_controller.dart';

class PauseButton extends StatelessWidget {
  const PauseButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.read<TimerPageController>();

    return FloatingActionButton(
      elevation: 1,
      onPressed: () {
        controller.pause();
      },
      child: const Icon(Icons.pause),
    );
  }
}
