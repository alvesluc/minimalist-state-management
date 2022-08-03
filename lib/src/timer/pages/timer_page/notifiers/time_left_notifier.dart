import 'dart:async';

import 'package:flutter/material.dart';

import '../../../services/service_locator.dart';
import '../../../services/storage_service/storage_service.dart';

class TimeLeftNotifier extends ValueNotifier<String> {
  TimeLeftNotifier() : super(_durationString(_initialValue));
  final _storageService = getIt.get<StorageService>();

  static const int _initialValue = 10;
  int _currentTimeLeft = _initialValue;

  final Ticker _ticker = Ticker();
  StreamSubscription<int>? _tickerSubscription;

  Future<void> initialize() async {
    final savedTime = await _storageService.getTimeLeft() ?? _initialValue;
    _updateTimeLeft(savedTime);
  }

  void start({required Function onDone}) {
    _tickerSubscription?.cancel();
    // TODO: Remove is not needed
    _updateTimeLeft(_currentTimeLeft);

    _tickerSubscription = _ticker.tick(ticks: _currentTimeLeft).listen(
      (duration) {
        _updateTimeLeft(duration);
      },
    );

    _tickerSubscription!.onDone(() {
      _storageService.saveTimeLeft(_currentTimeLeft);
      onDone();
    });
  }

  void pause() {
    _tickerSubscription?.pause();
    _storageService.saveTimeLeft(_currentTimeLeft);
  }

  void unpause() {
    _tickerSubscription?.resume();
  }

  void reset() {
    _tickerSubscription?.cancel();
    _updateTimeLeft(_initialValue);
  }

  void _updateTimeLeft(int seconds) {
    value = _durationString(seconds);
    _currentTimeLeft = seconds;
  }

  static String _durationString(int duration) {
    final minutes = ((duration / 60) % 60).floor().toString().padLeft(2, '0');
    final seconds = (duration % 60).floor().toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  @override
  void dispose() {
    _tickerSubscription?.cancel();
    _storageService.saveTimeLeft(_currentTimeLeft);
    super.dispose();
  }
}

class Ticker {
  Stream<int> tick({required int ticks}) {
    return Stream.periodic(
      const Duration(seconds: 1),
      (x) => ticks - x - 1,
    ).take(ticks);
  }
}
