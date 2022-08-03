import 'package:flutter/material.dart';

import '../../../services/service_locator.dart';
import '../timer_page_controller.dart';
import 'pause_button.dart';
import 'reset_button.dart';
import 'start_button.dart';

class ButtonsContainer extends StatelessWidget {
  const ButtonsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = getIt.get<TimerPageController>();

    return ValueListenableBuilder(
      valueListenable: controller.buttonNotifier,
      builder: (context, state, _) {
        return Row(
          children: [
            if (state == ButtonState.initial) ...const [
              StartButton(),
            ],
            if (state == ButtonState.started) ...const [
              PauseButton(),
              SizedBox(height: 20),
              ResetButton(),
            ],
            if (state == ButtonState.paused) ...const [
              StartButton(),
              SizedBox(height: 20),
              ResetButton(),
            ],
            if (state == ButtonState.finished) ...const [
              ResetButton(),
            ]
          ],
        );
      },
    );
  }
}
