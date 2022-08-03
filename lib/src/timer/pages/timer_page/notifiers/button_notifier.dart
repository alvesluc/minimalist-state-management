import 'package:flutter/foundation.dart';

class ButtonNotifier extends ValueNotifier<ButtonState> {
  ButtonNotifier() : super(ButtonState.initial);

  setInitial() => value = ButtonState.initial;

  setStarted() => value = ButtonState.started;

  setPaused() => value = ButtonState.paused;

  setFinished() => value = ButtonState.finished;
}

enum ButtonState {
  initial,
  started,
  paused,
  finished,
}
