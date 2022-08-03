import 'package:flutter/foundation.dart';
import 'package:minimalist/src/timer/pages/timer_page/notifiers/button_notifier.dart';

import 'notifiers/time_left_notifier.dart';

class TimerPageController {
  final timeLeftNotifier = TimeLeftNotifier();
  final buttonStateNotifier = ButtonNotifier();

  void initTimerState() {
    timeLeftNotifier.initialize();
  }

  void start() {
    if (buttonStateNotifier.value == ButtonState.paused) {
      _unpauseTimer();
    } else {
      _startTimer();
    }
  }

  void _unpauseTimer() {
    timeLeftNotifier.unpause();
    buttonStateNotifier.setStarted();
  }

  void _startTimer() {
    timeLeftNotifier.start(onDone: _finishTimer);
    buttonStateNotifier.setStarted();
  }

  void _finishTimer() {
    buttonStateNotifier.setFinished();
  }

  void pause() {
    timeLeftNotifier.pause();
    buttonStateNotifier.setPaused();
  }

  void reset() {
    timeLeftNotifier.reset();
    buttonStateNotifier.setInitial();
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
