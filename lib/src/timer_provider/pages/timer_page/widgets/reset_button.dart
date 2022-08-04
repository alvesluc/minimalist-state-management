import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../timer_page_controller.dart';

class ResetButton extends StatelessWidget {
  const ResetButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.read<TimerPageController>();

    return FloatingActionButton(
      elevation: 1,
      onPressed: () {
        controller.reset();
      },
      child: const Icon(Icons.replay),
    );
  }
}
