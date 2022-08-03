import 'package:flutter/material.dart';

import '../../../services/service_locator.dart';
import '../timer_page_controller.dart';

class ResetButton extends StatelessWidget {
  const ResetButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 1,
      onPressed: () {
        final controller = getIt<TimerPageController>();
        controller.reset();
      },
      child: const Icon(Icons.replay),
    );
  }
}
