import 'package:flutter/foundation.dart';

import 'notifiers/time_left_notifier.dart';

class TimerPageController {
  final timeLeftNotifier = TimeLeftNotifier();
  final buttonNotifier = ValueNotifier<ButtonState>(ButtonState.initial);

  void initTimerState() {
    timeLeftNotifier.initialize();
  }

  void start() {
    if (buttonNotifier.value == ButtonState.paused) {
      _unpauseTimer();
    } else {
      _startTimer();
    }
  }

  void _unpauseTimer() {
    timeLeftNotifier.unpause();
    buttonNotifier.value = ButtonState.started;
  }

  void _startTimer() {
    timeLeftNotifier.start(onDone: _finishTimer);
    buttonNotifier.value = ButtonState.started;
  }

  void _finishTimer() {
    buttonNotifier.value = ButtonState.finished;
  }

  void pause() {
    timeLeftNotifier.pause();
    buttonNotifier.value = ButtonState.paused;
  }

  void reset() {
    timeLeftNotifier.reset();
    buttonNotifier.value = ButtonState.initial;
  }

  void dispose() {
    timeLeftNotifier.dispose();
  }
}

enum ButtonState {
  initial,
  started,
  paused,
  finished,
}
